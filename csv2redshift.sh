cat $1 | iconv -c -f ISO-8859-1 -t utf8 > ${1}_utf8.txt
head -n 500000 ${1}_utf8.txt | csvsql -i postgresql -e iso-8859-1 --table $2 > tmpcreatetable.txt
s3cmd put ${1}_utf8.txt s3://$3/
psql -h $4 -p 5439 -U $5 $6 -W
connect to redshift instance (with psql):
cat tmpcreatetable.txt run create table statement
COPY $2 from 's3://$3/${1}_utf8.txt' CREDENTIALS 'aws_access_key_id=$7;aws_secret_access_key=$8' timeformat 'YYYY-MM-DD HH:MI:SS' CSV  TRUNCATECOLUMNS MAXERROR 10;
