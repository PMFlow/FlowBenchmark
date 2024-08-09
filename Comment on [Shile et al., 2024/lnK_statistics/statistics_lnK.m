clear all; close all
tic
% icorr=0; % Gaussian correlation
icorr=1; % exponential correlation
N=100;
I=201;
J=101;
varK=[0.1 0.5 1 1.5 2];
NS=I*J;
h=zeros(I,J,N); 
rmxx=zeros(1,length(varK)); rvxx=zeros(1,length(varK)); 
srmxx=zeros(1,length(varK)); srvxx=zeros(1,length(varK)); 

for m = 1:length(varK)%1:1 %
    rmx=0; rmy=0; rvx=0; rvy=0;
    srmx=0; srmy=0; srvx=0; srvy=0;
    for nn = 1:N
        if icorr==0
            load(['realizGauss','\varK_GAUSS_',num2str(m),'lnK_',num2str(nn),'.mat']); %\ to / !!!
        else
            load(['realizExp','\varK_Exp_',num2str(m),'lnK_',num2str(nn),'.mat']);
        end
        h(:,:,nn)=lnK; %pressure
    end
    
    for i=1:I
        for j=1:J
            mx=0; vx=0; 
            for n=1:N
                u=h(i,j,n); 
                mx=mx+u; vx=vx+u*u; 
            end
            mx=mx/N; vx=vx/N-mx.*mx; 
            rmx=rmx+mx; rvx=rvx+vx; 
            srmx=srmx+mx*mx; srvx=srvx+vx*vx; 
        end
    end
    
    rmx=rmx/NS; rvx=rvx/NS; 
    srmx=srmx/NS-rmx*rmx; srvx=srvx/NS-rvx*rvx; 
    rmxx(m)=rmx; rvxx(m)=rvx;
    srmxx(m)=sqrt(srmx); srvxx(m)=sqrt(srvx);
    eval m, rmx,rvx
end
figure(1); hold all;
subplot(1,2,1)
errorbar(varK,rmxx,srmxx,'-*'); 
xlabel('\sigma^{2}'); ylabel('mean(lnK)');
legend('<lnK>','Location','northwest'); legend('boxoff');
subplot(1,2,2)
errorbar(varK,rvxx,srvxx,'-*'); 
xlabel('\sigma^{2}'); ylabel('variance(lnK)');
legend('\sigma^{2}_{lnK}','Location','northwest'); legend('boxoff');

% if icorr==0
%     save('KGauss','varK','rmxx','srmxx','rvxx','srvxx');
% else    
%     save('KExp','varK','rmxx','srmxx','rvxx','srvxx');
% end

format shortE
sigma2=varK';
mh=rmxx'; errh=abs(srmxx');
varh=rvxx'; errvarh=abs(srvxx'); 
pm1=['+/-';'+/-';'+/-';'+/-';'+/-']; pm2=pm1;
T=table(sigma2,mh,pm1,errh,varh,pm2,errvarh,'VariableNames',{'Var_lnK' 'mean_h' 'pm1' 'err_h','var_h','pm2','err_var_h'});
display (T)

toc

%% icorr=0 - Gaussian correlation
%      Var_lnK        mean_h       pm1      err_h         var_h       pm2    err_var_h 
%     __________    ___________    ___    __________    __________    ___    __________
% 
%     1.0000e-01    -7.0395e-04    +/-    3.4197e-02    1.0096e-01    +/-    1.3224e-02
%     5.0000e-01     1.5317e-03    +/-    7.1418e-02    5.0177e-01    +/-    7.1002e-02
%     1.0000e+00     6.2721e-03    +/-    8.9706e-02    9.7723e-01    +/-    1.4025e-01
%     1.5000e+00    -2.6349e-03    +/-    1.0900e-01    1.4825e+00    +/-    2.1363e-01
%     2.0000e+00     1.4500e-02    +/-    1.3277e-01    1.9693e+00    +/-    2.6865e-01
% 
% Elapsed time is 2.073380 seconds.

%% icorr=1 - exponential correlation
%      Var_lnK        mean_h       pm1      err_h         var_h       pm2    err_var_h 
%     __________    ___________    ___    __________    __________    ___    __________
% 
%     1.0000e-01    -6.1625e-03    +/-    3.1387e-02    9.8892e-02    +/-    1.3779e-02
%     5.0000e-01     4.2907e-03    +/-    7.5379e-02    4.9928e-01    +/-    6.9072e-02
%     1.0000e+00     1.4543e-03    +/-    9.7098e-02    1.0005e+00    +/-    1.3709e-01
%     1.5000e+00     1.4452e-03    +/-    1.2592e-01    1.4648e+00    +/-    2.1061e-01
%     2.0000e+00     2.4084e-02    +/-    1.4019e-01    2.0342e+00    +/-    2.8072e-01
% 
% Elapsed time is 2.115075 seconds.
