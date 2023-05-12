#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=16
#SBATCH --nodelist=hpcnode10
#SBATCH --mem=0
#SBATCH --reservation=perf_ht_20220306
#SBATCH --output=32processNoAffinity-SMA-Experiment1-Hpcnode10-replication2
#========================== TASKS ================================
for i in `seq 0 31`;
do
echo $i
time ./exe $((0 + 1*$i)) $((0 + 1*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
