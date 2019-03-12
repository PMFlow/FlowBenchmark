//  compute K values on a grid; lnK is log-normally distributed with exponential correlation
//  generated with function "calc_K_2018-exp-lambda.c"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "calc_K_2018-Exp-lambda.c" 
FILE *pfk; 

#define XF 100
#define YF 100
#define dx 0.1
#define dy 0.1

long xi,yi;  
double xc,yc,res;

void write_K()
{

  printf("dx= %10.5f dy= %10.5f XF= %10d YF= %10d\n",dx,dy,XF,YF);  
  n_realiz=1; 
  for (xi=0; xi<XF; xi++) {
    for (yi=0; yi<YF; yi++) {
      xc=xi*dx; yc=yi*dy; IN[0]=xc; IN[1]=yc; calc_K(n_mod,l_cor,var_k,n_realiz,K_MEAN,IN,OUT,lambda); //calc_K(); // 
      fprintf(pfk,"%le %le %le \n",xc,yc,OUT[1]);
    }
    printf("x-section xi= %ld\n",xi);
  }
}


main()
{
  pfk=fopen("expK/ek","w");
  K_MEAN = 15;
  n_realiz = 0;
  n_mod = 100;
  l_cor[0] = 1.0; l_cor[1] = 2.0;
  var_k = 0.1;
  lambda=0.0;
   
  write_K();
  fclose(pfk); 
}
