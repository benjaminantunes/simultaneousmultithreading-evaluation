#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=32processAffinity-Testu01-Experiment1-Hpcnode11-replication29
#========================== TASKS ================================
for i in `seq 0 31`;
do
echo $i
time taskset -c $i ./exe $((0 + 1*$i)) $((0 + 1*$i )) &
done
wait
