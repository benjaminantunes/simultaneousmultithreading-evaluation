#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=1processNoAffinity-db12-Experiment1-Hpcnode11-replication27
#========================== TASKS ================================
for i in `seq 0 0`;
do
echo $i
time python3 exe.py $((0 + 32*$i)) $((31 + 32*$i )) &
done
wait
