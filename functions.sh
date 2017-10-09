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
function iprint() {
  local msg=$1
  local indntlvl=

  if [ $# -eq 2 ]; then
    indntlvl=$2
  else
    indntlvl=0
  fi

  if [ $indntlvl -eq 0 ]; then
    echo $msg
  elif [ $indntlvl -eq 1 ]; then
    sed -e "s/^/  /g" <<< ${msg}
  elif [ $indntlvl -eq 2 ]; then
    sed -e "s/^/    /g" <<< ${msg}
  elif [ $indntlvl -eq 3 ]; then
    sed -e "s/^/      /g" <<< ${msg}
  fi
}

#-----------------------------------------------------------------------
# Test functions
#-----------------------------------------------------------------------
if [ ${nb_test_functions} = true ]; then
  test_abs
  test_max
  test_min
fi
