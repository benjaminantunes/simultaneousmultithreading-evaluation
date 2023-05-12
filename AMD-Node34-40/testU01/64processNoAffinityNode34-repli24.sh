#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=64processNoAffinity-SmallCrush-Experiment1-Node34-replication24
#========================== TASKS ================================
for i in `seq 0 63`;
do
echo $i
time ./exe $((0 + 2*$i)) $((1 + 2*$i )) &
done
wait
