# Python program to explain os.environ object

# importing os module
import os

# Get the value of
# 'HOME' environment variable
home = os.environ['HOME']

# Print the value of
# 'HOME' environment variable
print("HOME:", home)

# Get the value of
# 'JAVA_HOME' environment variable
# using get operation of dictionary
java_home = os.environ.get('JAVA_HOME')
print("JAVA_HOME:", java_home)


profile = os.environ.get('aws_access_key_id')
print("Profile:", profile)