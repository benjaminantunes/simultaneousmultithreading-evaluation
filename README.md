Two folders: Intel-hpcnodeX-10 and AMD-Node34-40 are providing code and data. 

The first one contains experiment done on Intel nodes, and the second one contains experiment done on AMD nodes. 

In each folder, you will find additional subfolders: Db12-bench, SMA-Covid, testMonteCarlo, testU01 and mts-0000-9999. 

The first four folders contains all bash scripts to run the experiment, the codes and results file. 

The mts-0000-9999 folder contains all Mersenne Twister statuses used for repeatable parallel stochastic simulations. 

There is also a Jupyter Notebook file. This is the one you can use to reproduce all the results. 

To redo the experiment from beginning, you would need to run all scripts again to obtain data, that are analyzed by the Jupyter notebook. We used the script called “runBash.sh” to run them all, with Slurm. 
You can make your own choices on how you want to run these scripts and how many replications you want to do. 
For Db12, the program is a Python script, so it does not need any compilation. For SMA-Covid, use the command “make” to compile the project and generate executable. 
For testMonteCarlo, it is a small C file that needs to be compiled by yourself such as “gcc calculpi.c –O2 –o exe”. Finally, for TestU01, you will have to follow the instructions given by L’Ecuyer on the official TestU01 website.
