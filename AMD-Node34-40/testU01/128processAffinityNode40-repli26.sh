#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=128processAffinity-SmallCrush-Experiment1-Node40-replication26
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 127`;
do
echo $i
time taskset -c $i ./exe $((0 + 1*$i)) $((0 + 1*$i )) &
done
wait
