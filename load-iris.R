## http://www.r-bloggers.com/using-postgresql-in-r-a-quick-how-to/

library('RPostgreSQL')

## Loading required package: DBI

pg = dbDriver("PostgreSQL")

# Local Postgres.app database; no password by default
# Of course, you fill in your own database information here.
con = dbConnect(pg, user="postgres", password="secret",
                 host="localhost", port=5432, dbname="postgres")

# write the table into the database.
# use row.names=FALSE to prevent the query
# from adding the column 'row.names' to the table
# in the db
iris <- data.frame(iris)
colnames(iris) <- gsub(".", "_", colnames(iris), fixed = T)
dbWriteTable(con, 'iris', iris , row.names=FALSE)
