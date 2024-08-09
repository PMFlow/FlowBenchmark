%% Table2Exp, Table3Exp, Table4, and Table5: deviation from linear theory 
%% and 2-nd order approximation for exponential correlation of lnK

clear all; close all
tic

format bank;
sK=[0.1000 0.5000 1.0000 1.5000 2.0000];
rvxL=3/8*sK; rvyL=1/8*sK;

load('DGM_Exp')

sk=[0.5 1 1.5 2];
sx=[1.89e-01 3.79e-01 5.74e-01 7.64e-01]; % [Shile et L., 2024, Table 9]
sy=[6.28e-02 1.29e-01 1.96e-01 2.61e-01]; % [Shile et L., 2024, Table 9]
sLx=rvxL(2:5); sLy=rvyL(2:5);
Eq42x=3/8*sk.*(1+376/875*sk).^0.175; Eq43y=1/8*sk.*(1+328/535*sk).^0.535; % [Gotovac et al., 2009]

dsx=(sx-sLx)./sLx*100; dsy=(sy-sLy)./sLy*100;
errRBF=[dsx ; dsy]; Table2Exp=table(errRBF)
dsxDGM=(rvxx-rvxL)./rvxL*100; dsyDGM=(rvyy-rvyL)./rvyL*100; 
errDGM=[dsxDGM ; dsyDGM]; Table3Exp=table(errDGM)

dEq42x=(Eq42x-sLx)./sLx*100; dEq43y=(Eq43y-sLy)./sLy*100; 
errEqs=[dEq42x ; dEq43y]; Table4=table(errEqs)

dsxEq=(sx-Eq42x)./Eq42x*100; dsyEq=(sy-Eq43y)./Eq43y*100; 
errRBF_Eqs=[dsxEq ; dsyEq]; Table5=table(errRBF_Eqs)

toc

%% Table2Exp_Table3Exp_Table4_Table5
% 
% Table2Exp =
% 
%   2×1 table
% 
%                errRBF           
%     ____________________________
% 
%     0.80    1.07    2.04    1.87
%     0.48    3.20    4.53    4.40
% 
% 
% Table3Exp =
% 
%   2×1 table
% 
%                      errDGM                 
%     ________________________________________
% 
%     5.65     7.73    11.07    14.87    19.07
%     3.68    10.22    18.56    27.03    35.71
% 
% 
% Table4 =
% 
%   2×1 table
% 
%                  errEqs             
%     ________________________________
% 
%      3.46     6.46     9.10    11.47
%     15.38    29.15    41.75    53.44
% 
% 
% Table5 =
% 
%   2×1 table
% 
%                  errRBF_Eqs             
%     ____________________________________
% 
%      -2.58     -5.06     -6.46     -8.61
%     -12.91    -20.09    -26.25    -31.96
% 
% Elapsed time is 0.192804 seconds.
