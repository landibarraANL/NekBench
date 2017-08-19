#!/bin/bash

# lx1 range
# lelt range
# lp range
# machine -- cetus, theta, ??
# Test type
#       nodewise performance?
#       internode communication?
#       intranode-communication?
#       platform timer? mxm_tests? comm_tests?


this_file="${BASH_SOURCE[0]}"

lx1_list=
lx1_set=false
ly1_list=
lz1_list=

lelt_list=
lelt_set=false

lp_list=
lp_set=false

machine_list=
machine_set=false

test_list=
test_set=false

## Read input arguments
while [ $# -gt 0 ]; do
  case "$1" in
         -h|--help)
           echo "$help_msg"
           print_configs
           $exit_cmd
           ;;
         -x|--lx1)
           shift
           lx1_list=$1
           lx1_set=true
           ;;
         -y|--ly1)
           shift
           ly1_list=$1
           ;;
         -z|--lz1)
           shift
           lz1_list=$1
           ;;
         -e|--lelt)
           shift
           lelt_list=$1
           lelt_set=true
           ;;
         -p|--lp)
           shift
           lp_list=$1
           lp_set=true
           ;;
         -m|--machine)
           shift
           machine_list=$1
           machine_set=true
           ;;
         -t|--test)
           shift
           test_list=$1
           test_set=true
           ;;
  esac
  shift
done # end reading arguments

# Check if the requited variables are set
echo "$lx1_set"
echo "$lelt_set"
echo "$lp_set"
echo "$machine_set"
echo "$test_set"

if [ ${lx1_set} = false ] || [ ${lelt_set} = false ] \
      || [ ${lp_set} = false ] || [ ${machine_set} = false ] \
      || [ ${test_set} = false ]; then
  echo "You need to specify all lx1, lelt, lp, machine and test parameters"
fi

# Set ly1 and lz1 to lx1 by default if not specified
if [ ${#ly1_list} -eq 0 ]; then
  ly1_list=$lx1_list
fi
if [ ${#lz1_list} -eq 0 ]; then
  lz1_list=$lx1_list
fi

echo "lx1 = $lx1_list"
echo "ly1 = $ly1_list"
echo "lz1 = $lz1_list"
echo "lelt = $lelt_list"
echo "lp = $lp_list"
echo "machine = $machine_list"
