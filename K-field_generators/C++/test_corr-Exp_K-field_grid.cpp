// estimate correlation functions and correlation lengths of normal lnK fields with exponential correlation
// generated with function "calc_K_2018-Exp-lambda.c"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "calc_K_2018-Exp-lambda.c"
FILE *pfcu, *pfcv, *pftcu, *pftcv;

#define XF 10
#define YF 10
#define NR 1000 
#define L  200
#define dx 0.1
#define dy 0.1

long i,l,xi,yi,n,xinit,yinit;  
double v0,u0,xc,yc,arv,aru,lambu,lambv,coru[L+1],corv[L+1];
double sigu,sigv,npu,npv,vmed,umed,sigur,sigvr,vmedr,umedr;


void init()
{
  npu=0; npv=0; umedr=0; sigur=0;  vmedr=0; sigvr=0; 
  for (i=0; i<=L; i++) {
    coru[i]=0; corv[i]=0;
  }
}

void corr_lnK()
{
   double rcoru[L+1],rcorv[L+1],rsigu,rsigv;
   int NS;

   NS=XF*YF; printf("dx= %10.5f dy= %10.5f NS= %10d\n",dx,dy,NS);  
   for (l=0; l<=L; l++) {rcoru[l]=0.0; rcorv[l]=0.0; }
   for (xi=0; xi<XF; xi++) {
    for (yi=0; yi<YF; yi++) {
       xinit=xi*dx ; yinit=yi*dy;  init(); 
       for (n=0; n<NR; n++) {
	 n_realiz=n+1; 
	 for (l=0; l<=L; l++) {
	   xc=xinit; yc=yinit+l*dy; IN[0]=xc; IN[1]=yc; calc_K(n_mod,l_cor,var_k,n_realiz,K_MEAN,IN,OUT,lambda);
	   arv=OUT[0]; if (l==0) v0=arv;
	   corv[l]+=v0*arv;
	 }
	 vmedr+=arv; sigvr+=arv*arv; 
	 for (l=0; l<=L; l++) {
	   yc=yinit; xc=xinit+l*dx; IN[0]=xc; IN[1]=yc; calc_K(n_mod,l_cor,var_k,n_realiz,K_MEAN,IN,OUT,lambda); 
	   aru=OUT[0]; if (l==0) u0=aru;
	   coru[l]+=u0*aru;
	 }
	 umedr+=aru; sigur+=aru*aru;
       }
       umedr=umedr/NR; rsigu=sigur/NR-umedr*umedr; 
       vmedr=vmedr/NR; rsigv=sigvr/NR-vmedr*vmedr; 
       for (l=0; l<=L; l++) {
	 rcoru[l]+=(coru[l]/NR-umedr*umedr)/rsigu;
	 rcorv[l]+=(corv[l]/NR-vmedr*vmedr)/rsigv;
       }
     }
    printf("x-section xi= %ld \n",xi);
   }
   lambu=0.0; lambv=0.0;
   for (l=0; l<=L; l++) {
     rcoru[l]/=NS; 
     lambu+=rcoru[l];
     fprintf(pfcu,"%le %le %le \n",l*dx,rcoru[l],lambu*dx);
   }    
   for (l=0; l<=L; l++) {
     rcorv[l]/=NS;
     lambv+=rcorv[l];
     fprintf(pfcv,"%le %le %le \n",l*dx,rcorv[l],lambv*dx);
   }    
}

void tcorr_lnK()
{
  lambu=0.0; lambv=0.0;
  for (l=0; l<=L; l++) {
    coru[l]=exp(-(l*dx/l_cor[0]));
    corv[l]=exp(-(l*dy/l_cor[1]));
    lambu+=coru[l]*dx;
    lambv+=corv[l]*dy;
    fprintf(pftcu,"%le %le %le \n",l*dx,coru[l],lambu);
    fprintf(pftcv,"%le %le %le \n",l*dy,corv[l],lambv);
  }
}

main()
{
  pfcu=fopen("corrE/elku","w");
  pfcv=fopen("corrE/elkv","w");
  pftcu=fopen("corrE/telku","w");
  pftcv=fopen("corrE/telkv","w");
  
  K_MEAN = 15;
  n_realiz = 1;
  n_mod = 100;
  l_cor[0] = 1.0; l_cor[1] = 2.0;
  var_k = 0.1;
  lambda=0.0;
   
  corr_lnK();
  tcorr_lnK();

  fclose(pfcu); fclose(pfcv); 
}
