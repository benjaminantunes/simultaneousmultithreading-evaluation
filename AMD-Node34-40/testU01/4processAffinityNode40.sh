#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=4processAffinity-SmallCrush-Experiment1-Node40
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 3`;
do
echo $i
time taskset -c $i ./exe $((0 + 32*$i)) $((31 + 32*$i )) &
done
wait
