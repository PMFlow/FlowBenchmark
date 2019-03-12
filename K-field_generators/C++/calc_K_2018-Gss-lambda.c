/* generates lnK and K-fields at given (x,y) with Gaussian correlation by using the COS-randomization method */
/* spatially filtered lnK-fields are obtained for Gaussian filter of width "lambda">0                        */
/* ========================================================================================================= */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include<random>      // C++ library for random generated numbers
using namespace std;  // for 'mt19937' and 'cout' instead of 'std::cout'

/* RANDOM GENERATORS */
default_random_engine generator;  // SINGLE random numbers
mt19937 g(generator());											
uniform_real_distribution<double> rndU(0.0, 1.0); // SINGLE random uniform numbers
normal_distribution<double> rndN(0.0, 1.0);	  // SINGLE random normal numbers

/* VARIABLES */
#define PI 3.141592653589
static int nt,me,mee,imod;
static double x,y,vr,phase,lambda;
static double amplitude[10000],wavenum[10000][2],phi[10000];
static double n_mod, l_cor[2], var_k, n_realiz, K_MEAN;
static double NMOD,ZC[2],DELTAU;
static double IN[2],OUT[2];

/* amplitudes and modes for anisotropic  Gaussian correlation: */
void calc_modG()
{
static int imod,idim;
static double q[2],dummfac,sq2Pi,norm,gauss_factor;
 sq2Pi=1/sqrt(2)/PI;
 dummfac=sqrt(2.*var_k/NMOD);
 for (imod=0; imod<NMOD; imod++) {
   q[0]=sq2Pi*rndN(g)/ZC[0]; q[1]=sq2Pi*rndN(g)/ZC[1];
   for (idim=0; idim<2; idim++) wavenum[imod][idim]=q[idim];
   phi[imod]=2.*PI*rndU(g); 
   norm=1./sqrt(q[0]*q[0]+q[1]*q[1]);
   gauss_factor=exp(-lambda*lambda/norm/2.0);
   amplitude[imod]=dummfac*gauss_factor;
 }
}

/* function for lnK: */
double calc_K(double n_mod, double l_cor[2], double var_k, double  n_realiz, double K_MEAN, double IN[2], double OUT[2], double lambda)
{
  static int john = 0;
  NMOD=n_mod; ZC[0]=l_cor[0]; ZC[1]=l_cor[1]; x=IN[0]; y=IN[1];
  /* to compute one or more succesive realizations "n_realiz" on a single processor: */
  if  (n_realiz <john) john=n_realiz - 1;
  if (n_realiz > john) {calc_modG(); john = n_realiz;}

  /* to compute a single realization, specified realization "n_realiz", on the processor indexed by "me", 
     comment the two lines above and  uncomment this:*/
  /* me=0; mee=(int)n_realiz - 1; */
  /* if (john == 0)  */
  /*    { */
  /*     if (mee > me) { */
  /* 	for (nt=0; nt<=mee-1; nt++) calc_modG(); */
  /*     } */
  /*     for (nt=0; nt<=me; nt++) calc_modG(); */
  /*     john = 1; */
  /*   } */

  vr=0;
  for (imod=0; imod<NMOD; imod++) {
    phase=2*PI*(wavenum[imod][0]*x+wavenum[imod][1]*y)+phi[imod];
    vr+=amplitude[imod]*cos(phase);
  }
  
  OUT[0] = vr;
  /* this is the output for vr=y=fluctuations of lnK=Y=E(Y)+y; */

  OUT[1] = K_MEAN*exp(-var_k/2.0)* exp(vr);
  /* this is the output for the hydraulic conductivity K=exp(Y)=exp[E(Y)+y]=exp[E(Y)]exp(y) */
  /* one uses the 1-st order approximation E(K)=K_MEAN=exp[E(Y)]*exp(\sigma_{y}^{2}/2) [e.g. Attinger et al., Comput. Visual. Sci. 2002] */
  /* from the mean Darcy velocity U and slope J ===>  K _MEAN=U/J [e.g. Radu et al., Adv. Water Resour. 2011] */
}
