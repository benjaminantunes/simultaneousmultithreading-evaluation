#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=16processNoAffinity-SMA-Experiment1-Node40
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 15`;
do
echo $i
time ./exe $((0 + 8*$i)) $((7 + 8*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
