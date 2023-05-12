#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=8
#SBATCH --nodelist=hpcnode10
#SBATCH --mem=0
#SBATCH --reservation=perf_ht_20220306
#SBATCH --output=8processNoAffinity-Pi-Experiment1-Hpcnode10-replication13
#========================== TASKS ================================
for i in `seq 0 7`;
do
echo $i
time ./exe $((0 + 4*$i)) $((3 + 4*$i )) &
done
wait
