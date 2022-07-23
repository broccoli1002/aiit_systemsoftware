#!/bin/bash

# validation
## argument num
if [ $# -ne 2 ];then
    echo "Wrong number of arguments or invalid property assignment. Usage: $0 [num] [num]" 1>&2 
    exit 1
fi
## argument check
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ];then
    echo "input natural number" 1>&2 
    exit 1
fi

# calc
x=$1
y=$2
res=1
while [ $res -ne 0 ]
do
    res=$(($x % $y))
    x=$y
    y=$res
done

echo $x
