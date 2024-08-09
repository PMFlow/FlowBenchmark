clear all; close all

tic
% icorr=0; % Gaussian correlation
icorr=1; % exponential correlation
N=100;
I=201;
J=101;
varK=[0.1 0.5 1 1.5 2];
NS=I*J;
g=zeros(I,J,N); h=zeros(I,J,N); 
rmxx=zeros(1,length(varK)); rvxx=zeros(1,length(varK)); 
srmxx=zeros(1,length(varK)); srvxx=zeros(1,length(varK)); 
rmyy=zeros(1,length(varK)); rvyy=zeros(1,length(varK)); 
srmyy=zeros(1,length(varK)); srvyy=zeros(1,length(varK)); 

for m = 1:length(varK)%1:1 %
    rmx=0; rmy=0; rvx=0; rvy=0;
    srmx=0; srmy=0; srvx=0; srvy=0;
    for nn = 1:N
        if icorr==0
            load(['realiz_V_Gauss','\Vxy_GAUSS_',num2str(m),'V_',num2str(nn),'.mat']); %\ to / !!!
        else
            load(['realiz_V_Exp','\Vxy_Exp_',num2str(m),'V_',num2str(nn),'.mat']);
        end
        g(:,:,nn)=Vx; h(:,:,nn)=Vy; 
    end
    
    for i=1:I
        for j=1:J
            mx=0; vx=0; my=0; vy=0; 
            for n=1:N
                u=g(i,j,n); 
                mx=mx+u; vx=vx+u*u; 
                v=h(i,j,n); 
                my=my+v; vy=vy+v*v; 
            end
            mx=mx/N; vx=vx/N-mx.*mx; 
            rmx=rmx+mx; rvx=rvx+vx; 
            srmx=srmx+mx*mx; srvx=srvx+vx*vx; 
            my=my/N; vy=vy/N-my.*my; 
            rmy=rmy+my; rvy=rvy+vy; 
            srmy=srmy+my*my; srvy=srvy+vy*vy; 
        end
    end
    rmx=rmx/NS; rvx=rvx/NS; 
    srmx=srmx/NS-rmx*rmx; srvx=srvx/NS-rvx*rvx; 
    rmxx(m)=rmx; rvxx(m)=rvx;
    srmxx(m)=sqrt(srmx); srvxx(m)=sqrt(srvx);
    eval m, rmx,rvx
    rmy=rmy/NS; rvy=rvy/NS; 
    srmy=srmy/NS-rmy*rmy; srvy=srvy/NS-rvy*rvy; 
    rmyy(m)=rmy; rvyy(m)=rvy;
    srmyy(m)=sqrt(srmy); srvyy(m)=sqrt(srvy);
    eval m, rmy,rvy
end
figure(1); hold all;
subplot(1,2,1)
errorbar(varK,rmxx,srmxx,'-*'); 
xlabel('\sigma^{2}'); ylabel('mean(Vx)');
legend('<lnK>','Location','northwest'); legend('boxoff');
subplot(1,2,2)
errorbar(varK,rvxx,srvxx,'-*'); 
xlabel('\sigma^{2}'); ylabel('variance(Vx)');
legend('\sigma^{2}_{lnK}','Location','northwest'); legend('boxoff');

figure(2); hold all;
subplot(1,2,1)
errorbar(varK,rmyy,srmyy,'-*'); 
xlabel('\sigma^{2}'); ylabel('mean(Vy)');
legend('<lnK>','Location','northwest'); legend('boxoff');
subplot(1,2,2)
errorbar(varK,rvyy,srvyy,'-*'); 
xlabel('\sigma^{2}'); ylabel('variance(Vy)');
legend('\sigma^{2}_{lnK}','Location','northwest'); legend('boxoff');

if icorr==0
    save('VGauss','varK','rmxx','srmxx','rvxx','srvxx','rmyy','srmyy','rvyy','srvyy');
else    
    save('VExp','varK','rmxx','srmxx','rvxx','srvxx','rmyy','srmyy','rvyy','srvyy');
end

format shortE
sigma2=varK';
mVx=rmxx'; SD_Vx=abs(srmxx');
varVx=rvxx'; SD_varVx=abs(srvxx'); 
pm1=['+/-';'+/-';'+/-';'+/-';'+/-']; pm2=pm1;
T=table(sigma2,mVx,pm1,SD_Vx,varVx,pm2,SD_varVx,'VariableNames',{'Var_lnK' 'mVx' 'pm1' 'SD_Vx','varVx','pm2','SD_varVx'});
display (T)
mVy=rmyy'; SD_Vy=abs(srmyy');
varVy=rvyy'; SD_varVy=abs(srvyy'); 
pm1=['+/-';'+/-';'+/-';'+/-';'+/-']; pm2=pm1;
T=table(sigma2,mVy,pm1,SD_Vy,varVy,pm2,SD_varVy,'VariableNames',{'Var_lnK' 'mVy' 'pm1' 'SD_Vy','varVy','pm2','SD_varVy'});
display (T)

toc

%% icorr=0 - Gaussian correlation
    %  Var_lnK         mVx        pm1      SD_Vx         varVx       pm2     SD_varVx 
    % __________    __________    ___    __________    __________    ___    __________
    % 
    % 1.0000e-01    9.9928e-01    +/-    2.0575e-02    3.7430e-02    +/-    4.9914e-03
    % 5.0000e-01    1.0013e+00    +/-    3.8734e-02    1.9171e-01    +/-    2.4955e-02
    % 1.0000e+00    1.0034e+00    +/-    4.8033e-02    3.6176e-01    +/-    5.2554e-02
    % 1.5000e+00    9.9675e-01    +/-    7.1683e-02    5.5812e-01    +/-    7.9482e-02
    % 2.0000e+00    1.0185e+00    +/-    7.8435e-02    7.5610e-01    +/-    1.1027e-01
% 
    %  Var_lnK          mVy        pm1      SD_Vy         varVy       pm2     SD_varVy 
    % __________    ___________    ___    __________    __________    ___    __________
    % 
    % 1.0000e-01     1.4053e-03    +/-    1.1449e-02    1.2742e-02    +/-    1.6174e-03
    % 5.0000e-01    -1.0990e-03    +/-    2.7234e-02    6.1752e-02    +/-    9.0132e-03
    % 1.0000e+00    -2.5323e-04    +/-    3.3221e-02    1.2121e-01    +/-    1.6331e-02
    % 1.5000e+00    -1.8846e-03    +/-    3.8496e-02    1.8592e-01    +/-    2.9594e-02
    % 2.0000e+00    -4.3877e-03    +/-    4.9520e-02    2.4304e-01    +/-    3.3353e-02
 
% Elapsed time is 2.820365 seconds.

%% icorr=1 - exponential correlation
    %  Var_lnK         mVx        pm1      SD_Vx         varVx       pm2     SD_varVx 
    % __________    __________    ___    __________    __________    ___    __________
    % 
    % 1.0000e-01    9.9633e-01    +/-    1.8664e-02    3.7356e-02    +/-    5.0705e-03
    % 5.0000e-01    1.0094e+00    +/-    4.3998e-02    1.8759e-01    +/-    2.6865e-02
    % 1.0000e+00    1.0005e+00    +/-    5.9145e-02    3.8131e-01    +/-    5.3503e-02
    % 1.5000e+00    9.9392e-01    +/-    7.0028e-02    5.4244e-01    +/-    7.8214e-02
    % 2.0000e+00    1.0145e+00    +/-    7.8563e-02    7.6933e-01    +/-    1.0561e-01
% 
    %  Var_lnK          mVy        pm1      SD_Vy         varVy       pm2     SD_varVy 
    % __________    ___________    ___    __________    __________    ___    __________
    % 
    % 1.0000e-01     1.9421e-03    +/-    1.1383e-02    1.2527e-02    +/-    1.7604e-03
    % 5.0000e-01    -1.8429e-03    +/-    2.5845e-02    6.1266e-02    +/-    8.2587e-03
    % 1.0000e+00     2.4485e-03    +/-    3.6285e-02    1.2326e-01    +/-    1.7115e-02
    % 1.5000e+00     4.1705e-03    +/-    4.1040e-02    1.7997e-01    +/-    2.5490e-02
    % 2.0000e+00    -9.6086e-05    +/-    5.0333e-02    2.4932e-01    +/-    3.4103e-02
% 
% Elapsed time is 3.232275 seconds.
