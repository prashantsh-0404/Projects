
import boto3
import psycopg2
def db_connection():


    RS_PORT = 5439
    RS_USER = 'redshift'
    DATABASE = 'quicketl_redshift_cluster_e2e'
    CLUSTER_ID = 'quicketl-redshift-cluster-e2e'
    RS_HOST = 'quicketl-redshift-cluster-e2e.cnwnsb2ggq2h.us-west-2.redshift.amazonaws.com'

    client = boto3.client('redshift',region_name='us-west-2')

    cluster_creds = client.get_cluster_credentials(DbUser=RS_USER,
                                               DbName=DATABASE,
                                          ClusterIdentifier=CLUSTER_ID,
                                               AutoCreate=True)
    
    print (cluster_creds)

    try:
      conn = psycopg2.connect(
        host=RS_HOST,
        port=RS_PORT,
        user=cluster_creds['DbUser'],
        password=cluster_creds['DbPassword'],
        database=DATABASE
      )
      return conn
    except psycopg2.Error:
     print('Failed to open database connection.')

connectiondetails = db_connection()