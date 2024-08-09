%% Computes ensembles of random lnK fields
%% N=100 random modes; R=100 realizations;
clear ; close all ;

global state;
initstate; state;
NMOD = 100;
varK=[0.1 0.5 1 1.5 2];
NRealiz = 10^2 ; 
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
U_MEAN=1;
Vx=zeros(I,J);Vy=zeros(I,J);
%% realizations
tic ;
for icorr=1:2
lnK=zeros(I,J);
for m = 1 : length(varK)
    for n = 1 : NRealiz
        if icorr-1==0
            [wavenum, phi, amplitude] = V_Kraichnan_Gauss_param(NMOD,varK(m),ZC1,ZC2,U_MEAN,lambda);
        else
            [wavenum, phi, amplitude] = V_Kraichnan_Exp_param  (NMOD,varK(m),ZC1,ZC2,U_MEAN,lambda);
        end
        for i=1:I
            for j=1:J
                x=i*dx; y=j*dy;
                [ur,vr] = V_Kraichnan_func(x,y,wavenum, phi, amplitude);
                Vx(i,j)=ur+U_MEAN;
                Vy(i,j)=vr;
            end
       end           
        if icorr-1==0
            save(['realiz_V_Gauss','\Vxy_GAUSS_',num2str(m),'V_',num2str(n),'.mat'],'Vx','Vy');
        else
            save(['realiz_V_Exp\Vxy_Exp_',num2str(m),'V_',num2str(n),'.mat'],'Vx','Vy');
        end
    end
            fprintf('Number of realiz : %d \n',m) ;
end
end
toc ;

% main_realizations_lin_velocity
% Number of realiz : 1 
% Number of realiz : 2 
% Number of realiz : 3 
% Number of realiz : 4 
% Number of realiz : 5 
% Number of realiz : 1 
% Number of realiz : 2 
% Number of realiz : 3 
% Number of realiz : 4 
% Number of realiz : 5 
% Elapsed time is 59.473140 seconds.
