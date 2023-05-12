from db12 import single_dirac_benchmark
import sys


for i in range(int(sys.argv[1]),int(sys.argv[2]) + 1):
    print("######")
    print(single_dirac_benchmark())
