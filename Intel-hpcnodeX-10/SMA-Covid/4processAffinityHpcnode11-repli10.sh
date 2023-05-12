#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=4processAffinity-SMA-Experiment1-Hpcnode11-replication10
#========================== TASKS ================================
for i in `seq 0 3`;
do
echo $i
time taskset -c $i ./exe $((0 + 8*$i)) $((7 + 8*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
