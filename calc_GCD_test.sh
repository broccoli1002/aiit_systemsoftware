#!/bin/bash
tmp=/tmp/$$

ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

NORMAL_EXIT (){
  rm -f $tmp-*
  exit 0
}

# exec test
# test1: check args num
echo "Wrong number of arguments or invalid property assignment. Usage: ./calc_GCD.sh [num] [num]" > $tmp-args
./calc_GCD.sh 1 > $tmp-ans 2>&1 && ERROR_EXIT "error in test1-1" 
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test1-2"

# test2: check args type
echo "input natural number" > $tmp-nat
./calc_GCD.sh 1 'b' > $tmp-ans 2>&1 && ERROR_EXIT "error in test2-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-2"

# test3: normal case
echo "10" > $tmp-gcd
./calc_GCD.sh 10 60 > $tmp-ans 2>&1 || ERROR_EXIT "error in test3-1"
diff $tmp-ans $tmp-gcd || ERROR_EXIT "error in test3-2"

# return
echo "OK: success test" && NORMAL_EXIT
