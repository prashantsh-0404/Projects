
import boto3
from botocore.exceptions import ClientError
import json
import redshift_connector


authentication_profile_contents = {
    'host': 'rs-project.com3bvyn3afo.us-west-2.redshift.amazonaws.com',
    'region': 'us-west-2',
    'cluster_identifier': 'rs-project',
    'db_name': 'dev',
    'profile':'rs_role'
    
}

try:
    client = boto3.client("redshift")
    client.create_authentication_profile(
        AuthenticationProfileName="rs-auth",
        AuthenticationProfileContent=json.dumps(authentication_profile_contents)
    )
except ClientError:
    raise




