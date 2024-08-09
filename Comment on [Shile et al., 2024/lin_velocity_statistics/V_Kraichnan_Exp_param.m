function [wavenum, phi, amplitude] = V_Kraichnan_Exp_param(NMOD,varK,ZC1,ZC2,U_MEAN,lambda)
%global state;

dummfac=sqrt(2*varK/NMOD)*U_MEAN;

gamma_1=unifrnd(0,1,NMOD,1); 
gamma_2=unifrnd(0,1,NMOD,1);

wavenum(:,1)=sqrt(1./gamma_2.^2-1).*cos(2*pi*gamma_1)/(2*pi*ZC1);
wavenum(:,2)=sqrt(1./gamma_2.^2-1).*sin(2*pi*gamma_1)/(2*pi*ZC2);

norm=1./sqrt(wavenum(:,1).*wavenum(:,1)+wavenum(:,2).*wavenum(:,2));
phi = 2.*pi*rand(NMOD,1);
gauss_factor=exp(-lambda*lambda./norm/2);

amplitude(:,1)=(1-wavenum(:,1).^2.*norm.^2)*dummfac.*gauss_factor;
amplitude(:,2)=-wavenum(:,1).*wavenum(:,2).*norm.^2*dummfac.*gauss_factor;

