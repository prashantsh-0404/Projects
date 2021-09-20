import redshift_connector

# Connects to Redshift cluster using AWS credentials
conn = redshift_connector.connect(
    host='rs-project.com3bvyn3afo.us-west-2.redshift.amazonaws.com',
    database='dev',
    user='shishop',
    password='Admin0404'
 )

cursor: redshift_connector.Cursor = conn.cursor()
cursor.execute("create Temp table book(bookname varchar,author varchar)")
cursor.executemany("insert into book (bookname, author) values (%s, %s)",
                    [
                        ('One Hundred Years of Solitude', 'Gabriel García Márquez'),
                        ('A Brief History of Time', 'Stephen Hawking')
                    ]
                  )
cursor.execute("select * from book")

result: tuple = cursor.fetchall()
print(result)
# >> (['One Hundred Years of Solitude', 'Gabriel García Márquez'], ['A Brief History of Time', 'Stephen Hawking'])


