clear all; close all
tic

format bank;

load KGauss
figure(1); hold all;
errorbar(varK,rvxx,srvxx,'-*b',LineWidth=1); 
xlabel('$\sigma^{2}$',Interpreter='latex'); ylabel('Variance of $\ln(K)$',Interpreter='latex');
legend('Gaussian correlation of $\ln(K)$','Location','northwest',Interpreter='latex');
box on; legend(Box="off"); 

load KExp
figure(2); hold all;
errorbar(varK,rvxx,srvxx,'-*b',LineWidth=1); 
xlabel('$\sigma^{2}$',Interpreter='latex'); ylabel('Variance of $\ln(K)$',Interpreter='latex');
legend('Exponential correlation of $\ln(K)$','Location','northwest',Interpreter='latex');
box on; legend(Box="off"); 

figure(3)
load KGauss
errorbar(varK,rvxx,srvxx,'-*b',LineWidth=1); hold
load KExp
errorbar(varK,rvxx,srvxx,'-or',LineWidth=1); 
xlabel('$\sigma^{2}$',Interpreter='latex'); ylabel('Variance of $\ln(K)$',Interpreter='latex');
legend('Gaussian correlation of $\ln(K)$','Exponential correlation of $\ln(K)$','Location','northwest',Interpreter='latex');
box on; legend(Box="off"); 

s1=3/8; s2=1/8;
load KExp
figure(4); hold all;
errorbar(varK,rvxx,srvxx,'-*b',LineWidth=1); 
errorbar(varK,s1*rvxx,s1*srvxx,'-sk',LineWidth=1); 
errorbar(varK,s2*rvxx,s2*srvxx,'-or',LineWidth=1); 

xlabel('$\sigma^{2}$',Interpreter='latex'); ylabel('Variance of $\ln(K)$',Interpreter='latex');
legend('$\sigma^2_{\ln K}$','$\frac{3}{8}\;\sigma^2_{\ln K}$','$\frac{1}{8}\;\sigma^2_{\ln K}$','Location','northwest',Interpreter='latex');
box on; legend(Box="off"); 

toc