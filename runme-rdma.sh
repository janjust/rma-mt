#!/bin/bash

source file.hosts

basepath=/hpc/mtr_scrap/users/tomislavj/rma-mt

mpirun=`which mpirun`

mpiopts="-np 2 --map-by node --bind-to none -H ${hosts} --mca pml ob1 --mca osc rdma --mca btl self,uct --mca btl_uct_memory_domains ib/mlx5_2 --mca tl_uct_transports dc_mlx5 "

# threads=$1
# exeargs="-o put -s flush -t ${threads} "
exeargs="$1"
exe="$basepath/src/rmamt_bw ${exeargs} "
# exe="$basepath/src/rmamt_bibw ${exeargs} "
# exe="$basepath/src/rmamt_lat ${exeargs} "

set -x
$mpirun ${mpiopts} ${ucxopts} ${exe}
