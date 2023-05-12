#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcnode11
#SBATCH --mem=0
#SBATCH --output=16processNoAffinity-Pi-Experiment1-Hpcnode11-replication22
#========================== TASKS ================================
for i in `seq 0 15`;
do
echo $i
time ./exe $((0 + 2*$i)) $((1 + 2*$i )) &
done
wait
