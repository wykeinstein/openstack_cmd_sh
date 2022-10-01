#!/bin/bash
set -xe
arg_num=$#
vm_id=$1
for ((i=2; i<=arg_num; i++))
do
        port_id=$(openstack port list --fixed-ip ip-address=$2 -c ID -f value)
        openstack server add port $vm_id $port_id
        shift
done
