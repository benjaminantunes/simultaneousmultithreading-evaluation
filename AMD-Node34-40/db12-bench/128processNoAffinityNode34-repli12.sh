#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node35
#SBATCH --mem=0
#SBATCH --output=128processNoAffinity-db12-Experiment1-Node34-replication12
#========================== TASKS ================================
for i in `seq 0 127`;
do
echo $i
time python3 exe.py $((0 + 1*$i)) $((0 + 1*$i )) &
done
wait
