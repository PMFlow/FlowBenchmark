/* Computation of numerical coefficients "wavenumberExp0Nmod10000", "wavenumberExp0Nmod10000", and "phiExpNmod10000" which specify the */
/* fixed realization of the log-normal K-field with exponential correlation used in Manufactured_Solutions for both 1D and 2D cases    */
/* ====================================================================================================================================*/

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include<random>      /* C++ library for random generated numbers */
using namespace std;  

/* RANDOM GENERATORS */
default_random_engine generator;  
mt19937 g(generator());											
uniform_real_distribution<double> rndU(0.0, 1.0);  /* SINGLE random uniform numbers */
normal_distribution<double> rndN(0.0, 1.0);	   /* SINGLE random normal numbers */

/* VARIABLES */
#define PI 3.141592653589
static int nt,me,mee,imod;
static double amplitude[10000],wavenum[10000][2],phi[10000];

static int NMOD = 10000;
static double ZC[2] = { 1.0, 1.0 };

FILE *file1, *file2, *file3;

/* FUNCTION FOR NUMERICAL COEFFICIENTS */
void calc_modE()
{
static       int imod,idim;
static       double g1,g2,sq2Pi;
 sq2Pi=1/sqrt(2)/PI;
 for (imod=0; imod<NMOD; imod++) {
   g1=rndU(g); g2=rndU(g);
   wavenum[imod][0]=sqrt(1./(g2*g2)-1)*cos(2.*PI*g1)/(2.*PI*ZC[0]);
   wavenum[imod][1]=sqrt(1./(g2*g2)-1)*sin(2.*PI*g1)/(2.*PI*ZC[1]);
   phi[imod]=2.*PI*rndU(g);
 }
}

int main()
{
  calc_modE();

  file1 = fopen("wavenumberExp0Nmod10000", "w");
  file2 = fopen("wavenumberExp1Nmod10000", "w");
  file3 = fopen("phiExpNmod10000", "w");

  for (int j = 0; j<NMOD; j++)
    {
      fprintf(file1, "%le \n", wavenum[j][0]);
      fprintf(file2, "%le \n", wavenum[j][1]);
      fprintf(file3, "%le \n", phi[j]);
    }

  fclose(file1);
  fclose(file2);
  fclose(file3);
}





