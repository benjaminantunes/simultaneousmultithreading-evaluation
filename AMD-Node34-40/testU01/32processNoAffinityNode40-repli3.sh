#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=32processNoAffinity-SmallCrush-Experiment1-Node40-replication3
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 31`;
do
echo $i
time ./exe $((0 + 4*$i)) $((3 + 4*$i )) &
done
wait
