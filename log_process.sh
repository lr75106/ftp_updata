#!/bin/bash

ls *.log>log.list
num_log=$(cat log.list |wc -l)
echo $num_log

num=1

while [ $num -le ${num_log} ]
do
    VAR=`cat $(sed -n ''${num}'p' log.list)`
    echo $VAR>>all
    rm -f $(sed -n ''${num}'p' log.list)
    let num++
done
    
