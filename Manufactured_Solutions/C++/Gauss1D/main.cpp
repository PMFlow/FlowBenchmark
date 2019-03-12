// 1D Gaussian case: computation of K fields and source terms f

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define PI 3.141592653589

int i,j,imod,XF;  
double x,dx,coeff,phase,vr;
double Nmod,K_MEAN,varK,K,S1,S2,S3,F;
double C[10000][2],phi[10000];
FILE *fK,*fF, *file1, *file2, *file3;

void calc_K()
{
  coeff = sqrt(varK*2/Nmod) ;
  vr=0;
  for (imod=0; imod<Nmod; imod++) {
    phase=2*PI*(C[imod][0]*x+C[imod][1])+phi[imod];
    vr+=coeff*cos(phase);
  } 
  K= K_MEAN*exp(-varK/2.0)* exp(vr);
}

void calc_F()
{
  S1=0; S2=0; 
  for (imod=0; imod<Nmod; imod++) {
    S1+=(-2*PI)*C[imod][0]*sin(phi[imod] + (2*PI)*(C[imod][0]*x + C[imod][1])) ;                    
    S2+=cos(phi[imod] + (2*PI)*(C[imod][0]*x + C[imod][1])) ;                    
  }       
  F = K_MEAN*exp(-varK/2)*exp(sqrt(varK*2/Nmod)*S2)*(sqrt(varK*2/Nmod)*S1*cos(x)-sin(x));
}  
  
void write_KF()
{
  printf("dx= %10.5f XF= %10d \n",dx,XF);  
  for (i=0; i<XF; i++) {
      x=i*dx; 
      calc_K();
      fprintf(fK,"%le %le \n",x,K);
      calc_F();
      fprintf(fF,"%le %le \n",x,F);
  }
}

main()
{
  fK=fopen("KF/k","w");
  fF=fopen("KF/f","w");
  file1 = fopen("wavenumberGauss0Nmod10000", "r");
  file2 = fopen("wavenumberGauss1Nmod10000", "r");
  file3 = fopen("phiGaussNmod10000", "r");

  K_MEAN = 15;
  Nmod = 100;
  varK = 0.1;

  XF=200000;
  dx=0.001;

  for (int j = 0; j<Nmod; j++)
    {
      fscanf(file1, "%le \n", &C[j][0]);
      fscanf(file2, "%le \n", &C[j][1]);
      fscanf(file3, "%le \n", &phi[j]);
    }

  write_KF();

  fclose(file1);
  fclose(file2);
  fclose(file3);
  fclose(fK);
  fclose(fF);   
}
