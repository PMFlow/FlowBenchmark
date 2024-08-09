%% fig.5 and fig.6: mean variance of lnK and standard deviations

clear all; close all
tic

format shortE;

s1=3/8; s2=1/8;

figure; hold all;
load KGauss
SD_lnK1=s1*srvxx;
SD_lnK2=s2*srvxx;
p1=plot(varK,SD_lnK1,'.-.r',LineWidth=1); 
p2=plot(varK,SD_lnK2,'.-.b',LineWidth=1); 
load VGauss
SD_Vx=srvxx;
SD_Vy=srvyy;
p3=plot(varK,SD_Vx,'-*m','LineWidth',1);
p4=plot(varK,SD_Vy,'-+g','LineWidth',1);
title('Gaussian correlation of ln K');
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Standard deiviations');
legend([p1 p2 p3 p4],'$\frac{3}{8}\;SD(\sigma^2_{\ln K})$','$\frac{1}{8}\;SD(\sigma^2_{\ln K})$','$SD(\sigma^{2}_{lin,V_x})$',...
   '$SD(\sigma^{2}_{lin,V_y})$','Interpreter','latex','Location','northwest'); legend('boxoff');
box on; legend(Box="off"); 

disp('Gaussian correlation:');
sigma2=varK';
T=table(sigma2,SD_lnK1',SD_Vx',SD_lnK2',SD_Vy','VariableNames',...
    {'Var_lnK' '3.8 SD_Var(lnK)' 'SD_Var(Vx)','1/8 SD_Var(lnK)','SD_Var(Vy)'});
display (T)

figure; hold all;
load KExp
SD_lnK1=s1*srvxx;
SD_lnK2=s2*srvxx;
p1=plot(varK,SD_lnK1,'.-.r',LineWidth=1); 
p2=plot(varK,SD_lnK2,'.-.b',LineWidth=1); 
load VExp
SD_Vx=srvxx;
SD_Vy=srvyy;
p3=plot(varK,SD_Vx,'-*m','LineWidth',1);
p4=plot(varK,SD_Vy,'-+g','LineWidth',1);
title('Exponential correlation of ln K');
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Standard deiviations');
legend([p1 p2 p3 p4],'$\frac{3}{8}\;SD(\sigma^2_{\ln K})$','$\frac{1}{8}\;SD(\sigma^2_{\ln K})$','$SD(\sigma^{2}_{lin,V_x})$',...
   '$SD(\sigma^{2}_{lin,V_y})$','Interpreter','latex','Location','northwest'); legend('boxoff');
box on; legend(Box="off"); 

disp('Exponential correlation:');
sigma2=varK';
T=table(sigma2,SD_lnK1',SD_Vx',SD_lnK2',SD_Vy','VariableNames',...
    {'Var_lnK' '3.8 SD_Var(lnK)' 'SD_Var(Vx)','1/8 SD_Var(lnK)','SD_Var(Vy)'});
display (T)

toc

% fig_tab_linearV.m

% Gaussian correlation:
% 
% T =
% 
%   5×5 table
% 
%     Var_lnK    3.8 SD_Var(lnK)    SD_Var(Vx)    1/8 SD_Var(lnK)    SD_Var(Vy)
%     _______    _______________    __________    _______________    __________
% 
%     1.0000e-01      4.9590e-03       4.9914e-03      1.6530e-03       1.6174e-03
%     5.0000e-01      2.6626e-02       2.4955e-02      8.8752e-03       9.0132e-03
%     1.0000e+00      5.2595e-02       5.2554e-02      1.7532e-02       1.6331e-02
%     1.5000e+00      8.0113e-02       7.9482e-02      2.6704e-02       2.9594e-02
%     2.0000e+00      1.0075e-01       1.1027e-01      3.3582e-02       3.3353e-02
% 
% Exponential correlation:
% 
% T =
% 
%   5×5 table
% 
%     Var_lnK    3.8 SD_Var(lnK)    SD_Var(Vx)    1/8 SD_Var(lnK)    SD_Var(Vy)
%     _______    _______________    __________    _______________    __________
% 
%     1.0000e-01      5.1671e-03       5.0705e-03      1.7224e-03       1.7604e-03
%     5.0000e-01      2.5902e-02       2.6865e-02      8.6340e-03       8.2587e-03
%     1.0000e+00      5.1408e-02       5.3503e-02      1.7136e-02       1.7115e-02
%     1.5000e+00      7.8978e-02       7.8214e-02      2.6326e-02       2.5490e-02
%     2.0000e+00      1.0527e-01       1.0561e-01      3.5090e-02       3.4103e-02
% 
% Elapsed time is 1.001265 seconds.
