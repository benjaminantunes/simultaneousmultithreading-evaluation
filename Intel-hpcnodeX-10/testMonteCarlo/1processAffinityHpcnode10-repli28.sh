#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --nodelist=hpcnode10
#SBATCH --mem=0
#SBATCH --reservation=perf_ht_20220306
#SBATCH --output=1processAffinity-Pi-Experiment1-Hpcnode10-replication28
#========================== TASKS ================================
for i in `seq 0 0`;
do
echo $i
time taskset -c $(($i%16)) ./exe $((0 + 32*$i)) $((31 + 32*$i )) &
done
wait
