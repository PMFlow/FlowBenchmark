%% fig.1 and fig.2: comparison of velocity variances for Gaussian correlation of lnK

clear all; close all
tic

format bank;

figure(1); hold all;
load('FDM_Gauss')
p1=errorbar(varK,rvxx,srvxx,'-+g','LineWidth',1); 
p2=errorbar(varK,rvyy,srvyy,'-+g','LineWidth',1); 
load('FEM_Gauss')
p3=errorbar(varK,rvxx,srvxx,'-ob','LineWidth',1);
p4=errorbar(varK,rvyy,srvyy,'-ob','LineWidth',1);
load('DGM_Gauss')
p5=errorbar(varK,rvxx,srvxx,'-*r','LineWidth',1);
p6=errorbar(varK,rvyy,srvyy,'-*r','LineWidth',1);
rvxL=3/8*varK; rvyL=1/8*varK;
p9=plot(varK,rvxL,'-k','LineWidth',1); 
p10=plot(varK,rvyL,'-k','LineWidth',1);
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Velocity variance');
legend([p1 p3, p5 p9],'FDM','FEM','DGM','linear','Location','best'); legend('boxoff');
xlim([0 2.2]); box on;

sx=[1.87e-01 3.78e-01 5.69e-01 7.57e-01]; ssx=[5.03e-02 4.26e-02 5.97e-02 6.18e-02]; % [Shile et L., 2024, Table 9]
sy=[6.25e-02 1.26e-01 1.91e-01 2.58e-01]; ssy=[2.27e-02 3.74e-02 1.31e-02 5.39e-02]; % [Shile et L., 2024, Table 9]
sk=varK(2:5); sLx=rvxL(2:5); sLy=rvyL(2:5);

figure(2); hold all;
q1=errorbar(sk,sx,ssx,'-*r','LineWidth',1);
q2=plot(sk,sLx,'-k','LineWidth',1);
q3=errorbar(sk,sy,ssy,'-*r','LineWidth',1);
q4=plot(sk,sLy,'-k','LineWidth',1);
yticks([0 0.2 0.4 0.6 0.8 1]); 
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Velocity variance');
legend([q1 q2],'RBF','linear','Location','northwest'); legend('boxoff');
xlim([0 2.2]); ylim([0 1]); box on;

toc