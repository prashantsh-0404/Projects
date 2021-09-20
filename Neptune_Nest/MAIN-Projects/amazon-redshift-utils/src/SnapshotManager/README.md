# Amazon Redshift Snapshot Manager

__Please NOTE that this utility is now deprecated, and you should use the [native Redshift Snapshot Scheduler](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html#working-with-snapshot-scheduling) instead.__

Amazon Redshift is a fast, fully managed, petabyte-scale data warehouse that makes it simple and cost-effective to analyze all your data using your existing business intelligence tools. A Redshift cluster is automatically backed up to Amazon S3 by default, and 3 automatic snapshots of the cluster are retained for 24 hours. You can also convert these automatic snapshots to 'manual', which means they are kept forever. You can restore manual snapshots into new clusters at any time, or you can use them to do table restores, without having to use any third-party backup/recovery software. Snapshots are incremental, which means they only store the changes made since the last snapshot was taken, and are very space efficient.

This module gives you the ability to coordinate the Automatic Snapshot mechanism in your Amazon Redshift Clusters so that you can meet fine grained backup requirements. You don't have to write any code or manage any servers; all execution is done within [AWS Lambda](https://aws.amazon.com/lambda), and scheduled with [Amazon CloudWatch Events](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/WhatIsCloudWatchEvents.html).

![Architecture Diagram](Diagram.png)

_This codebase is now deprecated in favour of using native Redshift Snapshot Schedules. We will continue to maintain this code and fix bugs, but would highly recommend you consider using the following native API's:_

* __CreateSnapshotSchedule__: https://docs.aws.amazon.com/redshift/latest/APIReference/API_CreateSnapshotSchedule.html  
* __DescribeSnapshotSchedules__: https://docs.aws.amazon.com/redshift/latest/APIReference/API_DescribeSnapshotSchedules.html
* __ModifyClusterSnapshotSchedule__: https://docs.aws.amazon.com/redshift/latest/APIReference/API_ModifyClusterSnapshotSchedule.html
* __DescribeStorage__: https://docs.aws.amazon.com/redshift/latest/APIReference/API_DescribeStorage.html

For example, using the [aws-cli](https://aws.amazon.com/cli), you can create a schedule that creates snapshots every 4 hours:

```
aws redshift create-snapshot-schedule --schedule-definitions "rate(4 hours)" --schedule-identifier every-4-hours --schedule-description "4 hour snapshots"
aws redshift modify-cluster-snapshot-schedule --schedule-identifier every-4-hours --cluster-id <my-cluster-id>
```

You could then delete old snapshots with:

```
for snap in `aws redshift describe-cluster-snapshots --cluster-identifier <my-cluster-id> --start-time <begin-retetion-period> --end-time <end-retetion-period> --query Snapshots[*].SnapshotIdentifier --output text` ; do
    aws redshift delete-cluster-snapshot --snapshot-identifier $snap
done
```

## Addressing your Disaster Recovery requirements

There are two dimensions to disaster recovery which must be carefully considered when running a system at scale:

* RTO: Recovery Time Objective - how long does it take to recover from an outage scenario?
* RPO: Recovery Point Objective - when you have recovered, at what point in time will the system be consistent to?

A comprehensive overview of how to build systems which implement best practices for disaster recovery can be found [the AWS Disaster Recovery Whitepaper](https://aws.amazon.com/blogs/aws/new-whitepaper-use-aws-for-disaster-recovery/).

### Recovery Time Objective in Redshift

When using Amazon Redshift, the recovery time is determined by __the node type you are using__, __how many of those nodes you have__, and the __size of the data being restored__. It is vital that you practice restoration from snapshots created on the cluster to correctly determine the actual recovery time you'll see, so as to ensure your customer's expectations are met. This must be retested  any time you resize the cluster, or if your data volume changes significantly.

### Recovery Point Objective in Redshift

Amazon Redshift's automatic recovery snapshots are created every 8 hours, or every 5GB of data changed on disk, whichever comes first. For some customers, an 8 hour RPO is too long, and they require the ability to take snapshots more frequently. For other customers who have a very large amount of data change, these snapshots may be taken far too frequently and not allow long enough retention. 

That's where this module comes in - by supplying a simple configuration, you can ensure that snapshots are taken on a fixed time basis that meets your needs for data recovery.

## Getting Started

### Deploy the Lambda Function

You can deploy this AWS Lambda function by hand using the AWS Console or Command Line tools, or alternatively you can use the below links which deploy using AWS SAM:

| Region | Stack |
| ---- | ---- |
|ap-south-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ap-south-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ap-south-1.amazonaws.com/awslabs-code-ap-south-1/RedshiftSnapshotManager/deploy.yaml) |
|eu-west-3 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-3#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-eu-west-3.amazonaws.com/awslabs-code-eu-west-3/RedshiftSnapshotManager/deploy.yaml) |
|eu-west-2 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-2#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-eu-west-2.amazonaws.com/awslabs-code-eu-west-2/RedshiftSnapshotManager/deploy.yaml) |
|eu-west-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-eu-west-1.amazonaws.com/awslabs-code-eu-west-1/RedshiftSnapshotManager/deploy.yaml) |
|ap-northeast-3 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-3#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ap-northeast-3.amazonaws.com/awslabs-code-ap-northeast-3/RedshiftSnapshotManager/deploy.yaml) |
|ap-northeast-2 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-2#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ap-northeast-2.amazonaws.com/awslabs-code-ap-northeast-2/RedshiftSnapshotManager/deploy.yaml) |
|ap-northeast-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ap-northeast-1.amazonaws.com/awslabs-code-ap-northeast-1/RedshiftSnapshotManager/deploy.yaml) |
|sa-east-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=sa-east-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-sa-east-1.amazonaws.com/awslabs-code-sa-east-1/RedshiftSnapshotManager/deploy.yaml) |
|ca-central-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ca-central-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ca-central-1.amazonaws.com/awslabs-code-ca-central-1/RedshiftSnapshotManager/deploy.yaml) |
|ap-southeast-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ap-southeast-1.amazonaws.com/awslabs-code-ap-southeast-1/RedshiftSnapshotManager/deploy.yaml) |
|ap-southeast-2 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-2#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-ap-southeast-2.amazonaws.com/awslabs-code-ap-southeast-2/RedshiftSnapshotManager/deploy.yaml) |
|eu-central-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-central-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-eu-central-1.amazonaws.com/awslabs-code-eu-central-1/RedshiftSnapshotManager/deploy.yaml) |
|us-east-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3.amazonaws.com/awslabs-code-us-east-1/RedshiftSnapshotManager/deploy.yaml) |
|us-east-2 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-east-2#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-us-east-2.amazonaws.com/awslabs-code-us-east-2/RedshiftSnapshotManager/deploy.yaml) |
|us-west-1 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-west-1#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-us-west-1.amazonaws.com/awslabs-code-us-west-1/RedshiftSnapshotManager/deploy.yaml) |
|us-west-2 |  [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=RedshiftSnapshotManager&templateURL=https://s3-us-west-2.amazonaws.com/awslabs-code-us-west-2/RedshiftSnapshotManager/deploy.yaml) |

You only need to deploy the function once to support a virtually unlimited number of clusters. The function will be configured with:

* Max Runtime: 60 Seconds (each function only runs for 1 cluster, so this is plenty long enough - you can even reduce it)
* Memory Size: 128 MB (the minimum)
* Runtime: Node.js 8.10

Please note that the current account limit for Redshift manual snapshots is 20 per region. This module will create `24/snapshotIntervalHours * snapshotRetentionDays` snapshots, and so if this number is greater than 20 please open an AWS support case to have the limit increased. For example, an RPO of 2 hours with 7 days retention (as shown above) will create `24/2 * 7 = 84` snapshots.

### What's Created

After completion, you'll notice a Lambda Function called `RedshiftUtilsSnapshotManager`, plus there will be a CloudWatch Events Rule called `RedshiftUtilsSnapshotManager-<namespace>-15-mins` which runs every 15 minutes.

If you require additional clusters be snapshotted, you can either redeploy the function as above, or instead create a new CloudWatch Event Rule which contains the configuration required to invoke the function:

```
{
  "snapshotIntervalHours": "${SnapshotIntervalHours}",
  "targetResource": "${TargetClusterName}",
  "namespace": "${Namespace}",
  "region": "${Region}",
  "snapshotRetentionDays": "${SnapshotRetentionDays}"
}
```

### Confirm Execution

Once running, you will see that existing automatic snapshots, or new manual snapshots are created within the ```snapshotIntervalHours```. These snapshots are called ```rs-snapman-<cluster-name>-<yyyy>-<mm>-<dd>t<hh><mi><ss>```, and are tagged with:

* ```createdBy=AWS Redshift Utils Snapshot Manager```
* ```creationTimestamp=YYYY-MM-DD-HHmmss```
* ```scheduleNamespace=<config.namespace>```


__Only snapshots which are tagged using this scheme will be deleted by this utility - other snapshots are not affected.__ You can review the Lambda function's CloudWatch Log Streams for execution details, which include output about what the function is doing.

## Networking

This utility only connects to the Redshift service on your behalf, and doesn't require any access to your Redshift clusters. You therefore have 2 options for networking this function in your account:

1. Run outside of VPC: in this model, your Lambda functions will run in your account, not using VPC, and will connect to AWS public services directly
2. Run inside of VPC: in this model, your Lambda functions must run in a private Subnet which route to the internet via a NAT Gateway. [This article](https://aws.amazon.com/premiumsupport/knowledge-center/internet-access-lambda-function) gives you step-by-step instructions to set up this configuration.

If you misconfigure the networking for your deployment, then you will observe that the functions try to run, but never end up returning from a call to the Redshift services. This is because while the function may be able to talk to the Redshift endpoints, the return traffic cannot be routed to your container without a NAT in front. For more information, please consult [this reference architecture](https://github.com/aws-samples/aws-dbs-refarch-edw/tree/master/src/lambda-connections).

![Networking](networking.png)

## Making Changes

If you'd like to make changes, then great - we love open source. You can code your changes, and then you'll need to pull in the Node.js dependencies in order to test or deploy. From the `src/SnapshotManager` folder, run `npm install`, which will perform this download. You can then create a new Lambda zip archive by running `./build.sh assemble`, which will create `RedshiftSnapshotManager-<version>.zip` in the the `dist` folder. You can then run `./build.sh deploy...schedule...` as before.

### Install Pre-requisites

The included build script requires that you be able to use a terminal/command line, and have the [aws-cli](https://aws.amazon.com/cli), python (2.7x), [boto3](https://github.com/boto/boto3), and [shortuuid](https://pypi.python.org/pypi/shortuuid) installed. Alternatively you can deploy the zip file in the ['dist'](dist/RedshiftSnapshotManager-1.0.0.zip) folder and configure through the AWS Console.

```build.sh deploy <role-arn>```

where `<role-arn>` is the Amazon Resource Name for the IAM you want the function to run as (which determines what it can do). This Role will require at least the following permissions:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1466597619000",
            "Effect": "Allow",
            "Action": [
                "redshift:CopyClusterSnapshot",
                "redshift:CreateClusterSnapshot",
                "redshift:CreateTags",
                "redshift:DeleteClusterSnapshot",
                "redshift:DescribeClusterSnapshots"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        }
    ]
}

```
----

Amazon Redshift Utils Snapshot Manager

Copyright 2014-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

This project is licensed under the Apache-2.0 License.
