#!/bin/bash
set -xe
arg_num=$#
net_id=$1
subnet_id=`openstack network show $net_id  -c subnets -f value | sed -n "s/^.*'\(.*\)'.*$/\1/ p"`
echo $subnet_id
for ((i=2; i<=arg_num; i++))
do
	openstack port create --network $net_id --fixed-ip subnet=$subnet_id,ip-address=$2 $2
	shift
done
