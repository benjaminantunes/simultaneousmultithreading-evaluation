#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=32processNoAffinity-SmallCrush-Experiment1-Node34-replication27
#========================== TASKS ================================
for i in `seq 0 31`;
do
echo $i
time ./exe $((0 + 4*$i)) $((3 + 4*$i )) &
done
wait
