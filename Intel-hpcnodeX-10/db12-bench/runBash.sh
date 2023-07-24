#!/bin/bash

#for i in 1 2 4 8 16 32 64 128;
#do

#sbatch $i"processNoAffinityNode34.sh"
#sbatch $i"processAffinityNode34.sh"
#sbatch $i"processNoAffinityNode40.sh"
#sbatch $i"processAffinityNode40.sh"
#done


for numRepli in {16..29}; #il faut aller jusqu'a 29 : 0..29
do
    for i in 1 2 4 8 16 32;
    do
        sbatch $i"processNoAffinityHpcnode11-repli$numRepli.sh"
        sbatch $i"processAffinityHpcnode11-repli$numRepli.sh"
        sbatch $i"processNoAffinityHpcnode10-repli$numRepli.sh"
        sbatch $i"processAffinityHpcnode10-repli$numRepli.sh"
    done
done
