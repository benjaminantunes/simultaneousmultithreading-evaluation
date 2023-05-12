#include "Human.hpp"
#include "Position.hpp"
#include "RandMT.hpp"
#include "World.hpp"
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;

RandMT * randmt;

int main(int argc, char ** argv)
{

   
   //argv[0] = le nom de la commande
   //argv[1] = debut de liste de processus à lancer
   //argv[2] = fin de liste de processus à lancer
   //argv[3] = le nom du fichier de configVille
   //argv[4] = le nom du fichier de configParams
   //argv[5] = le nom du fichier de log dans lequel stocker le resultat de la simu
    

/*
   randmt =  new RandMT(argv[1]);

   // Ici je vais instancier un objet SimulationParams, qui va aller récupérer tous les paramètres. Ensuite, je passe cet objet dans le constructeur de World au lieu de tous les params.

   SimulationParams * simulationParams = new SimulationParams(argv[2],argv[3]);
   World * world = new World(simulationParams, argv[4], false);
   

   world->initialize(simulationParams);

   
   world->startSimulation(simulationParams);
*/
/*
 char const *  tabValeurs[100] = {"mtS10p12i-0001","mtS10p12i-0002","mtS10p12i-0003","mtS10p12i-0004","mtS10p12i-0005","mtS10p12i-0006","mtS10p12i-0007","mtS10p12i-0008","mtS10p12i-0009","mtS10p12i-0010","mtS10p12i-0011","mtS10p12i-0012","mtS10p12i-0013","mtS10p12i-0014","mtS10p12i-0015","mtS10p12i-0016","mtS10p12i-0017","mtS10p12i-0018","mtS10p12i-0019","mtS10p12i-0020","mtS10p12i-0021","mtS10p12i-0022","mtS10p12i-0023","mtS10p12i-0024","mtS10p12i-0025","mtS10p12i-0026","mtS10p12i-0027","mtS10p12i-0028","mtS10p12i-0029","mtS10p12i-0030","mtS10p12i-0031","mtS10p12i-0032","mtS10p12i-0033","mtS10p12i-0034","mtS10p12i-0035","mtS10p12i-0036","mtS10p12i-0037","mtS10p12i-0038","mtS10p12i-0039","mtS10p12i-0040","mtS10p12i-0041","mtS10p12i-0042","mtS10p12i-0043","mtS10p12i-0044","mtS10p12i-0045","mtS10p12i-0046","mtS10p12i-0047","mtS10p12i-0048","mtS10p12i-0049","mtS10p12i-0050","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002","mtS10p12i-0002"};
 */

char milliers = '0';
char centaines = '0';
char dizaines = '0';
char unites = '0';
int j;

   for(int i = atoi(argv[1]); i<=atoi(argv[2]); i++)
   {
       string buf("../mts-0000-0999/mts000M00");
       
       // Le + 48 est pour la table ASCII
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
       
       buf.append(valeur);
       printf("%s\n",valeur);
       randmt =  new RandMT(buf);

      // Ici je vais instancier un objet SimulationParams, qui va aller récupérer tous les paramètres. Ensuite, je passe cet objet dans le constructeur de World au lieu de tous les params.

      SimulationParams * simulationParams = new SimulationParams(argv[3],argv[4]);
      World * world = new World(simulationParams, argv[5], false);
   

      world->initialize(simulationParams);

   
      world->startSimulation(simulationParams);
   }
   
}
