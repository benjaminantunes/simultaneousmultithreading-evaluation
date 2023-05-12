#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=8processAffinity-Pi-Experiment1-Node40
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 7`;
do
echo $i
time taskset -c $i ./exe $((0 + 16*$i)) $((15 + 16*$i )) &
done
wait
