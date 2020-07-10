#!/bin/bash

echo -e "$(date +%F\ %T.%N) \t SQL Server entrypoint..."
/opt/mssql/bin/sqlservr &

# wait for the SQL Server to come up
sleep 60s

#run the setup script to create the DB and the schema in the DB
echo -e "$(date +%F\ %T.%N) \t Database server has started, creating database"
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U SA -P "SqlServer123!" -i create-db.sql

#run script to load data into the database
echo -e "$(date +%F\ %T.%N) \t Database created, loading data"
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U SA -P "SqlServer123!" -i load-data.sql

#run script to create stored procedure
echo -e "$(date +%F\ %T.%N) \t Data loaded, create stored procedure"
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U SA -P "SqlServer123!" -i create-procedure.sql

echo -e "$(date +%F\ %T.%N) \t Completed"
while true; do sleep 1000; done