#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=32processNoAffinity-db12-Experiment1-Hpcnode11-replication20
#========================== TASKS ================================
for i in `seq 0 31`;
do
echo $i
time python3 exe.py $((0 + 1*$i)) $((0 + 1*$i )) &
done
wait
