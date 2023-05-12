#include <stdio.h>
#include "mt19937ar.h"
#include <stdlib.h>
#include <TestU01.h> //On utilise juste battery.h dans notre cas.
#include <string.h>

int main(int argc, char ** argv) {
  // Initialise TestU01
  unif01_Gen* gen = unif01_CreateExternGen01("MersenneTwiter",genrand_real3);
 
  char milliers = '0';
  char centaines = '0';
  char dizaines = '0';
  char unites = '0';
  int j;

  for(int i = atoi(argv[1]); i<=atoi(argv[2]); i++)
  {
    const char * one = "../mts-0000-0999/mts000M00";
    char buf[31];
    strcpy(buf, one);
    

    j = i;
    int milliersNumber = j/1000;
    milliers = milliersNumber + 48;
    j = j - (1000*milliersNumber);
    
    int centaineNumber = j/100;
    centaines = centaineNumber + 48;
    j = j - (100*centaineNumber);
    
    int dizaineNumber = j/10;
    dizaines = dizaineNumber + 48;
    j = j - (10*dizaineNumber);
    
    int uniteNumber = j/1;
    unites = uniteNumber + 48;
    j = j - (1*uniteNumber);
    
    
    char valeur[5];
    valeur[0] = milliers;
    valeur[1] = centaines;
    valeur[2] = dizaines;
    valeur[3] = unites;
    valeur[4] = '\0';
    
    strcat(buf, valeur);
    printf("%s\n",valeur);
    restoreStatus(buf);
    bbattery_SmallCrush(gen);
  }

 
  // Clean up.

  unif01_DeleteExternGen01(gen);
  return 0;
}


