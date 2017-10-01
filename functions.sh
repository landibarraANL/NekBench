#-----------------------------------------------------------------------
# absolute value function
#-----------------------------------------------------------------------
function abs() {
  local in="${1}"

  if [ $in -lt 0 ]; then
    in=$(( -1*in ))
  fi

  echo $in
}

function test_abs() {
  local rslt1=$(abs -5)
  local rslt2=$(abs 5)

  if [ $rslt1 -eq 5 ] && [ $rslt2 -eq 5 ]; then
    echo "abs: Passed. Result=${rslt1}"
  else
    echo "abs: Failed. Result=${rslt1}"
  fi
}

#-----------------------------------------------------------------------
# max function
#-----------------------------------------------------------------------
function max() {
  local arg_list=("${@}")
  local out=0

  for elem in "${arg_list[@]}"; do
    if [ $elem -gt $out ]; then
      out=$elem
    fi
  done

  echo $out
}

function test_max()
{
  local a=(1 2 3 7 2 5)
  local rslt=$(max "${a[@]}")

  if [ $rslt -eq 7 ]; then
    echo "max: Passed. Result=${rslt}"
  else
    echo "max: Failed. Result=${rslt}"
  fi 
}

#-----------------------------------------------------------------------
# min function
#-----------------------------------------------------------------------
function min() {
  local arg_list=("${@}")
  local out="${arg_list[0]}"

  for elem in "${arg_list[@]}"; do
    if [ $elem -lt $out ]; then
      out=$elem
    fi
  done

  echo $out
}

function test_min()
{
  local a=(2 3 5 2 7 1)
  local rslt=$(min "${a[@]}")

  if [ $rslt -eq 1 ]; then
    echo "min: Passed. Result=${rslt}"
  else
    echo "min: Failed. Result=${rslt}"
  fi
}

#-----------------------------------------------------------------------
# print function
#-----------------------------------------------------------------------
function print() {
  local msg=$1
  local indent=$2
  local out=""

  if [ $indent -gt 0 ]; then
    for i in `seq 1 1 $indent`; do
      out=${out}"."
    done
  fi

  out=${out}${msg}
  echo ${out}
}

function test_print() {
  local passed=1
  local msg=

  msg=$(print "ttt" 0)
  if [ $msg != "ttt" ]; then
    passed=0
  fi

  msg=$(print "ttt" 2)
  if [ $msg != "..ttt" ]; then
    passed=0
  fi

  msg=$(print "ttt" 4)
  if [ $msg != "....ttt" ]; then
    passed=0
  fi

  if [ $passed -eq 1 ]; then
    echo "print: Passed."
  else
    echo "print: Failed."
  fi
}

#-----------------------------------------------------------------------
# Test functions
#-----------------------------------------------------------------------
if [ ${nb_test_functions} = true ]; then
  test_abs
  test_max
  test_min
  test_print
fi
