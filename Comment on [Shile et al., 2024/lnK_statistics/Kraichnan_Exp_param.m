function [wavenum, phi, amplitude] = ...
Kraichnan_Exp_param(NMOD,varK,ZC1,ZC2,lambda)
global state; 
dummfac=sqrt(2*varK/NMOD);
gamma_1=unifrnd(0,1,NMOD,1); 
gamma_2=unifrnd(0,1,NMOD,1);
wavenum(:,1)=sqrt(1./gamma_2.^2-1).*cos(2*pi*gamma_1)...
/(2*pi*ZC1);
wavenum(:,2)=sqrt(1./gamma_2.^2-1).*sin(2*pi*gamma_1)...
/(2*pi*ZC2); 
norm=1./sqrt(wavenum(:,1).*wavenum(:,1)+wavenum(:,2)...
.*wavenum(:,2)); phi = 2.*pi*rand(NMOD,1);
gauss_factor=exp(-lambda*lambda./norm/2.0);
amplitude=dummfac.*gauss_factor;
