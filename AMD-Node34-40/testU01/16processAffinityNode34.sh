#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=16processAffinity-SmallCrush-Experiment1-Node34
#========================== TASKS ================================
for i in `seq 0 15`;
do
echo $i
time taskset -c $(($i%64)) ./exe $((0 + 8*$i)) $((7 + 8*$i )) &
done
wait
