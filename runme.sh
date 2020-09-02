#!/bin/bash

basepath=/hpc/mtr_scrap/users/tomislavj/rma-mt

mpirun=`which mpirun`

hca="mlx5_0:1"
ucxopts="-x UCX_NET_DEVICES=${hca} "

hosts="jazz24:1,jazz27:1"
mpiopts="-np 2 --map-by node --bind-to none -H ${hosts} --tag-output "

# threads=$1
# exeargs="-o put -s flush -t ${threads} "
exeargs="$1"
exe="$basepath/src/rmamt_bw ${exeargs} "

set -x
$mpirun ${mpiopts} ${ucxopts} ${exe}


