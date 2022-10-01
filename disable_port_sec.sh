#!/bin/bash
set -e
arg_num=$#
for ((i=1; i<=arg_num; i++))
do
        openstack port list --fixed-ip ip-address=$1 -c ID -f value | xargs -I {} openstack port set --no-security-group  --disable-port-security {}
        shift
done
