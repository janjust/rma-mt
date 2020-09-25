#!/bin/bash

source file.hosts

basepath=/hpc/mtr_scrap/users/tomislavj/rma-mt

mpirun=`which mpirun`

hca="mlx5_0:1"
ucxopts="-x UCX_NET_DEVICES=${hca} -x UCX_TLS=rc_x"

mpiopts="-np 2 --map-by node --bind-to none -H ${hosts} --tag-output --mca pml ucx --mca osc ucx --mca btl ^uct"

# threads=$1
# exeargs="-o put -s flush -t ${threads} "
exeargs="$1"
exe="$basepath/src/rmamt_bw ${exeargs} "
# exe="$basepath/src/rmamt_bibw ${exeargs} "
# exe="$basepath/src/rmamt_lat ${exeargs} "

set -x
$mpirun ${mpiopts} ${ucxopts} ${exe}
