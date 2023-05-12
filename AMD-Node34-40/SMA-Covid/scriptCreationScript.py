import os


linesV1 = ["#!/bin/bash","#================= OPTIONS (s'applique à chaque job du tableau) =========================",\
        "#SBATCH --exclusive","#SBATCH --cpus-per-task=1","#SBATCH --nodelist=node35","#SBATCH --mem=0",\
        "#========================== TASKS ================================","do","echo $i","done","wait"]

linesV2 = ["#!/bin/bash","#================= OPTIONS (s'applique à chaque job du tableau) =========================",\
        "#SBATCH --exclusive","#SBATCH --cpus-per-task=1","#SBATCH --nodelist=node35","#SBATCH --mem=0",\
        "#========================== TASKS ================================","do","echo $i","done","wait"]

linesV3 = ["#!/bin/bash","#================= OPTIONS (s'applique à chaque job du tableau) =========================",\
        "#SBATCH --exclusive","#SBATCH --cpus-per-task=1","#SBATCH --nodelist=node40","#SBATCH --mem=0","#SBATCH --partition=repro",\
        "#========================== TASKS ================================","do","echo $i","done","wait"]

linesV4 = ["#!/bin/bash","#================= OPTIONS (s'applique à chaque job du tableau) =========================",\
        "#SBATCH --exclusive","#SBATCH --cpus-per-task=1","#SBATCH --nodelist=node40","#SBATCH --mem=0","#SBATCH --partition=repro",\
        "#========================== TASKS ================================","do","echo $i","done","wait"]

"""
for i in ['1','2','4','8','16','32','64','128']:
    j = 0
    with open(i+'processNoAffinityNode34.sh', 'w') as f:
        for line in linesV1:
            if(j==2):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --ntasks="+i)
                f.write('\n')
                j = j + 1
            elif(j==5):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --output="+i+"processNoAffinity-SMA-Experiment1-Node34")
                f.write('\n')
                j = j + 1
            elif(j==6):
                f.write(line)
                f.write('\n')
                f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                f.write('\n')
                j = j + 1
            elif(j==8):
                f.write(line)
                f.write('\n')
                f.write("time ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                f.write('\n')
                j = j + 1
                
            else:
                f.write(line)
                f.write('\n')
                j = j + 1


for i in ['1','2','4','8','16','32','64','128']:
    j = 0
    with open(i+'processAffinityNode34.sh', 'w') as f:
        for line in linesV2:
            if(j==2):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --ntasks="+i)
                f.write('\n')
                j = j + 1
            elif(j==5):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --output="+i+"processAffinity-SMA-Experiment1-Node34")
                f.write('\n')
                j = j + 1
            elif(j==6):
                f.write(line)
                f.write('\n')
                f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                f.write('\n')
                j = j + 1
                
            elif(j==8):
                f.write(line)
                f.write('\n')
                f.write("time taskset -c $(($i%64)) ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                f.write('\n')
                j = j + 1
                
            else:
                f.write(line)
                f.write('\n')
                j = j + 1

for i in ['1','2','4','8','16','32','64','128']:
    j = 0
    with open(i+'processNoAffinityNode40.sh', 'w') as f:
        for line in linesV3:
            if(j==2):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --ntasks="+i)
                f.write('\n')
                j = j + 1
            elif(j==5):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --output="+i+"processNoAffinity-SMA-Experiment1-Node40")
                f.write('\n')
                j = j + 1
            elif(j==7):
                f.write(line)
                f.write('\n')
                f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                f.write('\n')
                j = j + 1
                
            elif(j==9):
                f.write(line)
                f.write('\n')
                f.write("time ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                f.write('\n')
                j = j + 1
                
            else:
                f.write(line)
                f.write('\n')
                j = j + 1

for i in ['1','2','4','8','16','32','64','128']:
    j = 0
    with open(i+'processAffinityNode40.sh', 'w') as f:
        for line in linesV4:
            if(j==2):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --ntasks="+i)
                f.write('\n')
                j = j + 1
            elif(j==5):
                f.write(line)
                f.write('\n')
                f.write("#SBATCH --output="+i+"processAffinity-SMA-Experiment1-Node40")
                f.write('\n')
                j = j + 1
            elif(j==7):
                f.write(line)
                f.write('\n')
                f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                f.write('\n')
                j = j + 1
                
            elif(j==9):
                f.write(line)
                f.write('\n')
                f.write("time taskset -c $i ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                f.write('\n')
                j = j + 1
                
            else:
                f.write(line)
                f.write('\n')
                j = j + 1


"""
NB_REPLICATION = 30

for numRepli in range(0,NB_REPLICATION):
    for i in ['32','64','128']:
        j = 0
        with open(i+'processNoAffinityNode34-repli'+str(numRepli)+'.sh', 'w') as f:
            for line in linesV1:
                if(j==2):
                    f.write(line)
                    f.write('\n')
                    if(i == '128'):
                        f.write("#SBATCH --ntasks=64")
                        
                    else:
                        f.write("#SBATCH --ntasks="+i)
                    f.write('\n')
                    j = j + 1
                elif(j==5):
                    f.write(line)
                    f.write('\n')
                    f.write("#SBATCH --output="+i+"processNoAffinity-SMA-Experiment1-Node34-replication"+str(numRepli))
                    f.write('\n')
                    j = j + 1
                elif(j==6):
                    f.write(line)
                    f.write('\n')
                    f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                    f.write('\n')
                    j = j + 1
                elif(j==8):
                    f.write(line)
                    f.write('\n')
                    f.write("time ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                    f.write('\n')
                    j = j + 1
                    
                else:
                    f.write(line)
                    f.write('\n')
                    j = j + 1


    for i in ['32','64','128']:
        j = 0
        with open(i+'processAffinityNode34-repli'+str(numRepli)+'.sh', 'w') as f:
            for line in linesV2:
                if(j==2):
                    f.write(line)
                    f.write('\n')
                    if(i == '128'):
                        f.write("#SBATCH --ntasks=64")
                        
                    else:
                        f.write("#SBATCH --ntasks="+i)
                    f.write('\n')
                    j = j + 1
                elif(j==5):
                    f.write(line)
                    f.write('\n')
                    f.write("#SBATCH --output="+i+"processAffinity-SMA-Experiment1-Node34-replication"+str(numRepli))
                    f.write('\n')
                    j = j + 1
                elif(j==6):
                    f.write(line)
                    f.write('\n')
                    f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                    f.write('\n')
                    j = j + 1
                    
                elif(j==8):
                    f.write(line)
                    f.write('\n')
                    f.write("time taskset -c $(($i%64)) ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                    f.write('\n')
                    j = j + 1
                    
                else:
                    f.write(line)
                    f.write('\n')
                    j = j + 1

    for i in ['32','64','128']:
        j = 0
        with open(i+'processNoAffinityNode40-repli'+str(numRepli)+'.sh', 'w') as f:
            for line in linesV3:
                if(j==2):
                    f.write(line)
                    f.write('\n')
                    f.write("#SBATCH --ntasks="+i)
                    f.write('\n')
                    j = j + 1
                elif(j==5):
                    f.write(line)
                    f.write('\n')
                    f.write("#SBATCH --output="+i+"processNoAffinity-SMA-Experiment1-Node40-replication"+str(numRepli))
                    f.write('\n')
                    j = j + 1
                elif(j==7):
                    f.write(line)
                    f.write('\n')
                    f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                    f.write('\n')
                    j = j + 1
                    
                elif(j==9):
                    f.write(line)
                    f.write('\n')
                    f.write("time ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                    f.write('\n')
                    j = j + 1
                    
                else:
                    f.write(line)
                    f.write('\n')
                    j = j + 1

    for i in ['32','64','128']:
        j = 0
        with open(i+'processAffinityNode40-repli'+str(numRepli)+'.sh', 'w') as f:
            for line in linesV4:
                if(j==2):
                    f.write(line)
                    f.write('\n')
                    f.write("#SBATCH --ntasks="+i)
                    f.write('\n')
                    j = j + 1
                elif(j==5):
                    f.write(line)
                    f.write('\n')
                    f.write("#SBATCH --output="+i+"processAffinity-SMA-Experiment1-Node40-replication"+str(numRepli))
                    f.write('\n')
                    j = j + 1
                elif(j==7):
                    f.write(line)
                    f.write('\n')
                    f.write("for i in `seq 0 "+str(int(i)-1)+"`;")
                    f.write('\n')
                    j = j + 1
                    
                elif(j==9):
                    f.write(line)
                    f.write('\n')
                    f.write("time taskset -c $i ./exe $((0 + "+str(int(128/int(i)))+"*$i)) $(("+str(int(128/int(i) - 1))+" + "+str(int(128/int(i)))+"*$i )) configParis configNoMesure logConfigParisProc$i &")
                    f.write('\n')
                    j = j + 1
                    
                else:
                    f.write(line)
                    f.write('\n')
                    j = j + 1

