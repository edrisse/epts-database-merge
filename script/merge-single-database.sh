#!/bin/sh
FULL_FILE_NAME=$1
DATABASE_NAME=$2
mysql -uetl -pAdmin123 -e "drop database if exists $DATABASE_NAME; create database $DATABASE_NAME;"
mysql -uetl -pAdmin123 $DATABASE_NAME < $FULL_FILE_NAME
/opt/java/pdi-ce-8.2.0.0-342/data-integration/kitchen.sh -file=/home/edrisse/eptsreports-testing-scripts/transformations/merge/merge-data.kjb $DATABASE_NAME
if [ $? -eq 0 ]
then
    echo "Merge effectuado com sucesso"
    echo "Merge effectuado com sucesso"
    echo "Merge effectuado com sucesso"
else
    echo "********Ocorreram erros na execução do Merge********"
    echo "********Ocorreram erros na execução do Merge********"
    echo "********Ocorreram erros na execução do Merge********"
fi