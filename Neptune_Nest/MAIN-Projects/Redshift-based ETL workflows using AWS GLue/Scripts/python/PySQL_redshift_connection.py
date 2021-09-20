import pg
import boto3
import base64
from botocore.exceptions import ClientError
import json

#uses session manager name to return connection and credential information
def connection_info(db):

	session = boto3.session.Session()
	client = session.client(
		service_name='secretsmanager'
	)

	get_secret_value_response = client.get_secret_value(SecretId=db)

	if 'SecretString' in get_secret_value_response:
		secret = json.loads(get_secret_value_response['SecretString'])
	else:
		secret = json.loads(base64.b64decode(get_secret_value_response['SecretBinary']))
		
	return secret


#creates a connection to the cluster
def get_connection(db,db_creds):

	con_params = connection_info(db_creds)
	
	rs_conn_string = "host=%s port=%s dbname=%s user=%s password=%s" % (con_params['host'], con_params['port'], db, con_params['username'], con_params['password'])
	rs_conn = pg.connect(dbname=rs_conn_string)
	rs_conn.query("set statement_timeout = 1200000")
	
	return rs_conn


#submits a query to the cluster
def query(con,statement):
    res = con.query(statement)
    return res
