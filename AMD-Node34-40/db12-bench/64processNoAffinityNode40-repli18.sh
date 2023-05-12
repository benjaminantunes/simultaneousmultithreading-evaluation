#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=64processNoAffinity-db12-Experiment1-Node40-replication18
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 63`;
do
echo $i
time python3 exe.py $((0 + 2*$i)) $((1 + 2*$i )) &
done
wait