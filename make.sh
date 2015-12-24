#!/bin/bash
name=test
num=0

while [ $num -lt 20 ]
do
    echo ${name}${num}>>${name}${num}.log
    date "+%Y-%m-%d %H:%M:%S">>${name}${num}.log
    echo fist blood!>>${name}${num}.log
    echo double kill!>>${name}${num}.log
    echo fuck kill!>>${name}${num}.log
    echo moster kill!>>${name}${num}.log
    let num++
done
