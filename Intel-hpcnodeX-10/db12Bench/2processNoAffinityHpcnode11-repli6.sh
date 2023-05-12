#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=2processNoAffinity-db12-Experiment1-Hpcnode11-replication6
#========================== TASKS ================================
for i in `seq 0 1`;
do
echo $i
time python3 exe.py $((0 + 16*$i)) $((15 + 16*$i )) &
done
wait
