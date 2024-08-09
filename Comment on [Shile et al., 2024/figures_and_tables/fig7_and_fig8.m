%% fig.7 and fig.8: analysis of figure 13 in [Shile et al., 2024]

clear all; close all
tic

format bank;

sk=[0.5 1 1.5 2];
sx=[1.89e-01 3.79e-01 5.74e-01 7.64e-01]; % [Shile et L., 2024, Table 9]
sy=[6.28e-02 1.29e-01 1.96e-01 2.61e-01];% [Shile et L., 2024, Table 9]
Eq42x=3/8*sk.*(1+376/875*sk).^0.175; Eq43y=1/8*sk.*(1+328/535*sk).^0.535; % [Gotovac et al., 2009]

figure(7); hold all;
r1=plot(sk,Eq42x,'-+b','LineWidth',1); 
r2=plot(sk,Eq43y,'-+b','LineWidth',1);
r3=plot(sk(1:4),sx,'-*r','LineWidth',1);
r4=plot(sk(1:4),sy,'-*r','LineWidth',1);
r5=plot(sk([2 4]),Eq42x([2 4]),'dr','Markersize',7,'LineWidth',1); 
r6=plot(sk([2 4]),Eq43y([2 4]),'dr','Markersize',7,'LineWidth',1);
yticks([0 0.2 0.4 0.6 0.8 1]);
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Velocity variance');
legend([r1 r3 r5],'Eq. (3)','RBF [Shile et al., 2024, Table 9]',...
    'RBF [Shile et al., 2024, Fig 13]','Location','northwest'); legend('boxoff');
ylim([0 1]);  box on;


sk=[0.5 1 1.5 2 8]; skEq=sk; 
sx=[1.89e-01 3.79e-01 5.74e-01 7.64e-01 3.89];
sx8trend=sx(1)+(sx(4)-sx(1))/1.5*8;
sxtrend=[1.89e-01 3.79e-01 5.74e-01 7.64e-01 sx8trend];
sy=[6.28e-02 1.29e-01 1.96e-01 2.61e-01 2.59];
sy8trend=sy(1)+(sy(4)-sy(1))/1.5*8;
sytrend=[6.28e-02 1.29e-01 1.96e-01 2.61e-01 sy8trend]; 
Eq42x=3/8*skEq.*(1+376/875*skEq).^0.175; Eq43y=1/8*skEq.*(1+328/535*skEq).^0.535;

figure(8); hold all;
q1=plot(skEq,Eq42x,'-+b','LineWidth',1);
q2=plot(skEq,Eq43y,'-+b','LineWidth',1);
q3=plot(sk,sx,'-*r','LineWidth',1);
q4=plot(sk,sy,'-*r','LineWidth',1);
q5=plot(sk,sxtrend,'-k','LineWidth',1);
q6=plot(sk,sytrend,'-k','LineWidth',1);
box on;
xlabel('$\sigma^{2}$','Interpreter','latex'); ylabel('Velocity variance');
legend([q1 q3 q5],'Eq. (3)','RBF','trend',...
    'Location','northwest'); legend('boxoff');
xlim([0 8]); 

toc