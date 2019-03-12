%% 2D exponential case: computation of K fields and source terms f

clear;
close all;
clc;

load phiExpNmod10000;
load wavenumberExp0Nmod10000;
load wavenumberExp1Nmod10000;

KMean = 15;

Nmod = input('Nmod = ');
varK = input('varK = ');

phi = phiExpNmod10000(1:Nmod);
C(:,1) = wavenumberExp0Nmod10000(1:Nmod);
C(:,2) = wavenumberExp1Nmod10000(1:Nmod);

step = 0.1;

X1 = 0;
X2 = 20;
X = X1 : step : X2;

Y1 = 0;
Y2 = 10;
Y = Y1 : step : Y2;

N1 = length(X);
N2 = length(Y);

fct=zeros(N1,N2);
Coeff=zeros(N1,N2);

for i = 1 : N1
    for j = 1 : N2
        fct(i,j) = func(X(i),Y(j),Nmod,KMean,varK,C(:,1),C(:,2),phi);
        Coeff(i,j) = K(X(i),Y(j),Nmod,KMean,varK,C(:,1),C(:,2),phi);
    end
end

figure;
mesh(X,Y,Coeff');
xlabel('x'); ylabel('y'); zlabel('K(x,y)'); view(20,50);
figure;
mesh(X,Y,fct') ;
xlabel('x'); ylabel('y');  zlabel('f(x,y)'); view(20,50);
