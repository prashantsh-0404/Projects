
import boto3
from botocore.exceptions import ClientError
import json
import redshift_connector
import os

authentication_profile_contents = {
    'host': 'rs-project.com3bvyn3afo.us-west-2.redshift.amazonaws.com',
    'region': 'us-west-2',
    'cluster_identifier': 'rs-project',
    'db_name': 'dev',
    'profile':'rs_role'
    
}

with redshift_connector.connect(
    iam=True,
    region='us-west-2',
    auth_profile="rs-auth-profile",
    profile="rs_role",
    access_key_id = os.environ.get('aws_access_key_id'),
    secret_access_key = os.environ.get('aws_secret_access_key'),
    
    db_user="tables"
) as conn:
    pass

# with redshift_connector.connect(
#     iam=True,
#     region='us-west-2',
#     profile=os.environ["a"],
#     auth_profile="rs-auth",
#     db_user="bobby_tables"
# ) as conn:
#     pass