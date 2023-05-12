#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=8processNoAffinity-db12-Experiment1-Hpcnode11-replication8
#========================== TASKS ================================
for i in `seq 0 7`;
do
echo $i
time python3 exe.py $((0 + 4*$i)) $((3 + 4*$i )) &
done
wait
