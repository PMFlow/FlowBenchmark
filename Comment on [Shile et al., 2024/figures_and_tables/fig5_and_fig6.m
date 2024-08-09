%% fig.5 and fig.6: mean variance of lnK and its standard deviation

clear all; close all
tic

format bank;

figure(5)
load KGauss
errorbar(varK,rvxx,srvxx,'-*b',LineWidth=1); hold
load KExp
errorbar(varK,rvxx,srvxx,'-or',LineWidth=1); 
xlabel('$\sigma^{2}$',Interpreter='latex'); ylabel('Variance of $\ln(K)$',Interpreter='latex');
legend('Gaussian correlation of $\ln(K)$','Exponential correlation of $\ln(K)$','Location','northwest',Interpreter='latex');
xlim([0 2.2]); box on; legend(Box="off"); 

sk=varK(2:5); 
ssx=[4.38e-02 1.42e-02 5.37e-02 3.08e-02]; % [Shile et L., 2024, Table 9]
ssy=[7.12e-02 2.69e-02 1.98e-02 3.81e-02]; % [Shile et L., 2024, Table 9]

s1=3/8; s2=1/8;
figure(6); hold all;
load('DGM_Exp')
p1=plot(varK,srvxx,'-*r','LineWidth',1);
p2=plot(varK,srvyy,'-+b','LineWidth',1);
load KExp
p3=plot(varK,s1*srvxx,'.-.r',LineWidth=1); 
p4=plot(varK,s2*srvxx,'.-.b',LineWidth=1); 
p5=plot(sk,ssx,'-^m','LineWidth',1.5);
p6=plot(sk,ssy,'-vg','LineWidth',1.5);

xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Standard deiviations');
legend([p1 p2 p3 p4 p5 p6],'DGM: $SD(\sigma^{2}_{V_x})$','DGM: $SD(\sigma^{2}_{V_y})$',...
   '$\frac{3}{8}\;SD(\sigma^2_{\ln K})$','$\frac{1}{8}\;SD(\sigma^2_{\ln K})$','RBF: $SD(\sigma^{2}_{V_x})$',...
   'RBF: $SD(\sigma^{2}_{V_y})$','Interpreter','latex','Location','northwest'); legend('boxoff');
box on; legend(Box="off"); 

toc