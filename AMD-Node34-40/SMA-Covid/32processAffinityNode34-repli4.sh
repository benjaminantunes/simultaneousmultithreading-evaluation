#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=32
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node35
#SBATCH --mem=0
#SBATCH --output=32processAffinity-SMA-Experiment1-Node34-replication4
#========================== TASKS ================================
for i in `seq 0 31`;
do
echo $i
time taskset -c $(($i%64)) ./exe $((0 + 4*$i)) $((3 + 4*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
