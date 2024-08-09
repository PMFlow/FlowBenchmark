%% Computes ensembles of random lnK fields
%% N=100 random modes; R=100 realizations;
clear ; close all ;

global state;
initstate; state;
NMOD = 100;
varK=[0.1 0.5 1 1.5 2];
NRealiz = 10^2 ; % 1; % 
ZC1 = 1.0;
ZC2 = 1.0;
K_MEAN = 15;
lambda=0;
% icorr=0; % Gaussian correlation
% icorr=1; % exponential correlation
%% Grid Initialization
I=201;
J=101;
a=0; b=20;
c=0; d=10;
dx=(b-a)/(I-1);
dy=(d-c)/(J-1);
%% realizations
tic ;
for icorr=1:2
lnK=zeros(I,J);
for m = 1 : length(varK)
    for n = 1 : NRealiz
        if icorr-1==0
            [wavenum, phi, amplitude] = Kraichnan_Gauss_param(NMOD,varK(m),ZC1,ZC2,lambda);
        else
            [wavenum, phi, amplitude] = Kraichnan_Exp_param(NMOD,varK(m),ZC1,ZC2,lambda);
        end
        for i=1:I
            for j=1:J
                x=i*dx; y=j*dy;
                Kxy = Kraichnan_func(x,y,wavenum,phi,amplitude,K_MEAN,varK(m));
                lnK(i,j)=Kxy;
            end
        end           
        if icorr-1==0
            save(['realizGauss','\varK_GAUSS_',num2str(m),'lnK_',num2str(n),'.mat'],'lnK');
        else
            save(['realizExp\varK_Exp_',num2str(m),'lnK_',num2str(n),'.mat'],'lnK');
        end
    end
            fprintf('Number of varK : %d \n',m) ;
end
end
toc ;

