%% Table2Gauss and Table3Gauss: deviation from linear theory for Gaussian correlation of lnK

clear all; close all
tic

format bank;
sK=[0.1000 0.5000 1.0000 1.5000 2.0000];
rvxL=3/8*sK; rvyL=1/8*sK;

sx=[1.87e-01 3.78e-01 5.69e-01 7.57e-01]; % [Shile et L., 2024, Table 9]
sy=[6.25e-02 1.26e-01 1.91e-01 2.58e-01]; % [Shile et L., 2024, Table 9]
sLx=rvxL(2:5); sLy=rvyL(2:5);
dsx=(sx-sLx)./sLx*100; dsy=(sy-sLy)./sLy*100;
errRBF=[dsx ; dsy]; Table2Gauss = table(errRBF)

load('DGM_Gauss')
dsxDGM=(rvxx-rvxL)./rvxL*100; dsyDGM=(rvyy-rvyL)./rvyL*100;
errDGM=[dsxDGM ; dsyDGM]; Table3Gauss = table(errDGM)

toc

%% Table2Gauss_and_Table3Gauss.m
% 
% Table2Gauss =
% 
%   2×1 table
% 
%                  errRBF             
%     ________________________________
% 
%     -0.27     0.80     1.16     0.93
%      0.00     0.80     1.87     3.20
% 
% 
% Table3Gauss =
% 
%   2×1 table
% 
%                      errDGM                 
%     ________________________________________
% 
%     0.14     1.78     3.35     4.69     5.97
%     5.20    10.18    15.27    19.59    23.45
% 
% Elapsed time is 0.168008 seconds.
