#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --exclusive
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --output=1processNoAffinity-SMA-Experiment1-Node40
#SBATCH --partition=repro
#========================== TASKS ================================
for i in `seq 0 0`;
do
echo $i
time ./exe $((0 + 128*$i)) $((127 + 128*$i )) configParis configNoMesure logConfigParisProc$i &
done
wait
