#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4
#SBATCH --nodelist=hpcnode10
#SBATCH --mem=0
#SBATCH --reservation=perf_ht_20220306
#SBATCH --output=4processNoAffinity-Testu01-Experiment1-Hpcnode10-replication5
#========================== TASKS ================================
for i in `seq 0 3`;
do
echo $i
time ./exe $((0 + 8*$i)) $((7 + 8*$i )) &
done
wait
