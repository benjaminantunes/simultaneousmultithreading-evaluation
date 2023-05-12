#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=2
#SBATCH --nodelist=hpcnode10
#SBATCH --mem=0
#SBATCH --reservation=perf_ht_20220306
#SBATCH --output=2processAffinity-Testu01-Experiment1-Hpcnode10-replication7
#========================== TASKS ================================
for i in `seq 0 1`;
do
echo $i
time taskset -c $(($i%16)) ./exe $((0 + 16*$i)) $((15 + 16*$i )) &
done
wait
