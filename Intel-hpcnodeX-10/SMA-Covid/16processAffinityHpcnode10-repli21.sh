#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=16
#SBATCH --nodelist=hpcnode10
#SBATCH --mem=0
#SBATCH --reservation=perf_ht_20220306
#SBATCH --output=16processAffinity-SMA-Experiment1-Hpcnode10-replication21
#========================== TASKS ================================
for i in `seq 0 15`;
do
echo $i
time taskset -c $(($i%16)) ./exe $((0 + 2*$i)) $((1 + 2*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
