#!/bin/bash
set -xe
arg_num=$#
vm_id=$1
net_id=$2
subnet_id=`openstack network show $net_id  -c subnets -f value | sed -n "s/^.*'\(.*\)'.*$/\1/ p"`
echo $subnet_id
for ((i=3; i<=arg_num; i++))
do
        port_id=$(openstack port create -c id -f value --network $net_id --fixed-ip subnet=$subnet_id,ip-address=$3 $3)
        openstack server add port $vm_id $port_id
        shift
done
