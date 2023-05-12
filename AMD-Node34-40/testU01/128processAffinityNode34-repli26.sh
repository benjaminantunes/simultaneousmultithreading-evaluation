#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=128processAffinity-SmallCrush-Experiment1-Node34-replication26
#========================== TASKS ================================
for i in `seq 0 127`;
do
echo $i
time taskset -c $(($i%64)) ./exe $((0 + 1*$i)) $((0 + 1*$i )) &
done
wait
