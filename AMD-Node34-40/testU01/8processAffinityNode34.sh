#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=8processAffinity-SmallCrush-Experiment1-Node34
#========================== TASKS ================================
for i in `seq 0 7`;
do
echo $i
time taskset -c $(($i%64)) ./exe $((0 + 16*$i)) $((15 + 16*$i )) &
done
wait
