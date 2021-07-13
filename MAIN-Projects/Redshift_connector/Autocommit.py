# Make sure we're not in a transaction
con.rollback()
con.autocommit = True
con.run("VACUUM")
con.autocommit = False
