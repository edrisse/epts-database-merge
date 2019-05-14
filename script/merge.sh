#!/bin/bash
merge_db=$MERGE_TOOL_MERGE_DB
host=$MERGE_TOOL_DB_HOST
user=$MERGE_TOOL_DB_USER

if [ -z $merge_db ]
then
    merge_db="merge_db"
fi

if [ -z $host ]
then
    host="localhost"
fi

if [ -z $user ]
then
    user="etl"
fi

mysql -u$user -pAdmin123 -h$host -e "drop database if exists $merge_db; create database $merge_db;"
first=1
for file in "dumps"/*
do
    database=$(basename "$file" ".sql")
    if [ $first -eq 1 ]
    then
        echo "Importing initial database into $merge_db from file $file"
        #mysql -u$user -pAdmin123 $merge_db < $file
        #mysql -u$user -pAdmin123 $merge_db < sql-scripts/merge.sql
        first=0
    else
        echo "Merging database $database from file $file"
        #./merge-single-database.sh $file $database > "output/$database.out" &
    fi
done