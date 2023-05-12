#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node34
#SBATCH --mem=0
#SBATCH --output=1processAffinity-db12-Experiment1-Node34
#========================== TASKS ================================
for i in `seq 0 0`;
do
echo $i
time taskset -c $(($i%64)) python3 exe.py $((0 + 128*$i)) $((127 + 128*$i )) &
done
wait
