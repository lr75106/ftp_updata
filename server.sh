#!/bin/bash
name=test
num=0
while [ $num -lt 20 ]
do
    A=`cat ${name}${num}.log`
    echo $A >>all.log
    rm ${name}${num}.log
    let num++
done

