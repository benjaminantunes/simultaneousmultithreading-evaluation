#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=2processAffinity-Pi-Experiment1-Hpcnode11-replication7
#========================== TASKS ================================
for i in `seq 0 1`;
do
echo $i
time taskset -c $i ./exe $((0 + 16*$i)) $((15 + 16*$i )) &
done
wait
