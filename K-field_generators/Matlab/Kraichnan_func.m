function Kxy = ...
Kraichnan_func(x,y,wavenum,phi,amplitude,K_MEAN,varK) 
phase=2*pi*(wavenum(:,1).*x+wavenum(:,2).*y)+phi;
ak=sum(amplitude.*cos(phase));
%Kxy=ak; %lnK;
Kxy=K_MEAN*exp(-varK/2)*exp(ak); %hydraulic conductivity
