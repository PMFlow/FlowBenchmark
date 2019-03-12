%% 1D exponential case: computation of K fields and source terms f

clear;
close all;
clc;

load phiExpNmod10000 ;
load wavenumberExp0Nmod10000;
load wavenumberExp1Nmod10000;

Nmod = input('Nmod = ');
varK = input('varK = ');

KMean = 15;

phi = phiExpNmod10000(1:Nmod);
C(:,1) = wavenumberExp0Nmod10000(1:Nmod);
C(:,2) = wavenumberExp1Nmod10000(1:Nmod);

X1 = 0;
X2 = 200;

dx = 10^(-3) ;
X = X1:dx:X2;
n=length(X);

fct=zeros(1,n);
Kfct=zeros(1,n);

for i = 1 : n
    fct(i) = func(X(i),Nmod,KMean,varK,C(:,1),C(:,2),phi);
    Kfct(i) = K(X(i),Nmod,KMean,varK,C(:,1),C(:,2),phi);
end

figure;
plot(X,Kfct) ;
xlabel('x'); ylabel('K(x)');
figure;
plot(X,fct);
xlabel('x'); ylabel('f(x)');
