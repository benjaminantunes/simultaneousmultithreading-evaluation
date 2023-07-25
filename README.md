Two folders: Intel-hpcnodeX-10 and AMD-Node34-40 are providing code and data. 

The first one contains experiment done on Intel nodes, and the second one contains experiment done on AMD nodes.

In each folder, you will find additional subfolders: Db12-bench, SMA-Covid, testMonteCarlo, testU01 and mts-0000-9999. 

The first four folders contains all bash scripts to run the experiment, the codes and results file.
For AMD, the bag of work is 128 processes, to run on 1, 2, 4, 8, 16, 32, 64 and 128 cores. You will find Bash script to run each experiment, with associated results file.
For Intel, it is the same, except that it is on 32 cores (with a bag of work of 32 processes).
The experiment is embarrassingly parallel, so we do not suffer from a loss of performance from something else than SMT.  

The mts-0000-9999 folder contains all Mersenne Twister statuses used for repeatable parallel stochastic simulations. 

There is also a Jupyter Notebook file in the two folder (Intel and AMD). This is the one you can use to reproduce all the results. 
For AMD architecture, we have done 30 replications when using 32, 64 and 128 cores. For 1, 2, 4, 8 and 16, due to a lack of time, we could only do 1 or 2 replications.
For Intel architecture, we have done 30 replications for every applications except for the Covid-SMA, which demand to much time, so we only have 1 or 2 replications.
We hope that the code inside the Jupyter Notebook will help you to understand how results file are used.
To redo the experiment from beginning, you would need to run all scripts again to obtain data, that are analyzed by the Jupyter notebook. We used the script called “runBash.sh” to run them all, with Slurm. (Be carefull, if you do not rename results file, by running bash script, you will erase current results file).

You can make your own choices on how you want to run these scripts and how many replications you want to do. 
For Db12, the program is a Python script, so it does not need any compilation. You will need Python3, and to install DB12 package. You can follow this documentation : https://github.com/DIRACGrid/DB12

For SMA-Covid, use the command “make” to compile the project and generate executable. You will need recent version of g++ compiler. Documentation with a full reproducible environnement will come later in 2024. 
For testMonteCarlo, it is a small C file that needs to be compiled by yourself with a command such as “gcc calculpi.c –O2 –o exe”. 
Finally, for TestU01, you will have to follow the instructions given by L’Ecuyer on the official TestU01 website (http://simul.iro.umontreal.ca/testu01/tu01.html).

If you have any compution problem, you could contact us at: benjamin.antunes@uca.fr

