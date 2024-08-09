%% fig.3 and fig.4: comparison of velocity variances for exponential correlation of lnK

clear all; close all
tic

format bank;

figure(3); hold all;
load('FDM_Exp')
p1=errorbar(varK,rvxx,srvxx,'-+g');
p2=errorbar(varK,rvyy,srvyy,'-+g'); 
load('FEM_Exp')
p3=errorbar(varK,rvxx,srvxx,'-ob');
p4=errorbar(varK,rvyy,srvyy,'-ob');
load('DGM_Exp')
p5=errorbar(varK,rvxx,srvxx,'-*r','LineWidth',1);
p6=errorbar(varK,rvyy,srvyy,'-*r','LineWidth',1);
rvxL=3/8*varK; rvyL=1/8*varK;
p9=plot(varK,rvxL,'-k','LineWidth',1); 
p10=plot(varK,rvyL,'-k','LineWidth',1);
yticks([0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6]);
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Velocity variance');
legend([p1 p3, p5 p9],'FDM','FEM','DGM','linear','Location','best'); legend('boxoff');
xlim([0 2.2]); ylim([0 1.6]); box on;

sx=[1.89e-01 3.79e-01 5.74e-01 7.64e-01]; ssx=[4.38e-02 1.42e-02 5.37e-02 3.08e-02]; % [Shile et L., 2024, Table 9]
sy=[6.28e-02 1.29e-01 1.96e-01 2.61e-01]; ssy=[7.12e-02 2.69e-02 1.98e-02 3.81e-02]; % [Shile et L., 2024, Table 9]
sk=varK(2:5); sLx=rvxL(2:5); sLy=rvyL(2:5);
Eq42x=3/8*sk.*(1+376/875*sk).^0.175; Eq43y=1/8*sk.*(1+328/535*sk).^0.535; % [Gotovac et al., 2009]

figure(4); hold all;
q1=plot(sk,Eq42x,'-+b','LineWidth',1);
q2=plot(sk,Eq43y,'-+b','LineWidth',1);
q3=errorbar(sk,sx,ssx,'-*r','LineWidth',1);
q4=plot(sk,sLx,'-k','LineWidth',1);
q5=errorbar(sk,sy,ssy,'-*r','LineWidth',1);
q6=plot(sk,sLy,'-k','LineWidth',1);
yticks([0 0.2 0.4 0.6 0.8 1]); 
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Velocity variance');
legend([q1 q3 q4],'Eq. (3)','RBF','linear','Location','northwest'); legend('boxoff');
xlim([0 2.2]); ylim([-0.017 1]); box on;

toc