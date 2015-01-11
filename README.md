# redshift-utils
Data loading utilities for redshift

Input: CSV(s), s3 bucketname, Tablename, Redshift server, db, credentials

Steps:
1. Generate create table statement (with csvsql)

2. convert csv to utf-8 (with iconv)

3. optional - split csv into several parts to load faster (with split)

4. copy to s3 (with s3cmd)

5. connect to redshift instance (with psql)

6. run create table statement

7. run copy statement


1. convert to UTF-8 and copy to s3 (optionally, files can be split into smaller files and loaded in parallel)
Shell script:
for f in *-a*
do
     cat $f | iconv -c -f ISO-8859-1 -t utf8 > ${f}_utf8.txt
     echo "processed $f to ${f}_utf8.txt"
     s3cmd put ${f}_utf8.txt s3://bucketname/
done

