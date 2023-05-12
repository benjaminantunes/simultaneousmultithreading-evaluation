#!/bin/bash
#================= OPTIONS =========================
#SBATCH --exclusive
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=4processAffinity-SMA-Experiment1-Node34
#========================== TASKS ================================
for i in `seq 0 3`;
do
echo $i
time taskset -c $(($i%64)) ./exe $((0 + 32*$i)) $((31 + 32*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
