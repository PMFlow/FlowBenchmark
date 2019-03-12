clear all; close all
global state;
initstate; state;
tic
ic=2; % =1: exp_corr; =2: Gss_corr
N=1000; L=200; Lx=10; Ly=10; dx=0.1; dy=0.1;
NMOD=100;
varK=0.1;
K_MEAN=14.268;
lambda=0.0;
ZC1=2.0;
ZC2=1.0;
Ksx=zeros(1,L); Ksy=zeros(1,L);
rmx=0; rmy=0; rvx=0; rvy=0;
rcorrx=zeros(1,L); rcorry=zeros(1,L);
lcx=0; lcy=0; lcorrx=zeros(1,L); lcorry=zeros(1,L);
NS=Lx*Ly;

for j=1:Lx
    for k=1:Ly
        mx=0; my=0; vx=0; vy=0;
        xinit=j*dx; yinit=k*dy;
        corrx=zeros(1,L); corry=zeros(1,L);
        for n=1:N
            if ic==1
                [wavenum, phi, amplitude] = Kraichnan_Exp_param(NMOD,varK,ZC1,ZC2,lambda);
            else
                [wavenum, phi, amplitude] = Kraichnan_Gauss_param(NMOD,varK,ZC1,ZC2,lambda);
            end
            
            for i=1:L
                x=xinit+i*dx; y=yinit;
                Kxy = Kraichnan_func(x,y,wavenum,phi,amplitude,K_MEAN,varK);
                if i==1 K0=Kxy; end
                if j==1 && k==1 && n==1; Ksx(i)=Kxy; end
                corrx(i)=corrx(i)+K0*Kxy;
            end
            mx=mx+Kxy; vx=vx+Kxy*Kxy;
            for i=1:L
                x=xinit; y=yinit+i*dy;
                Kxy = Kraichnan_func(x,y,wavenum,phi,amplitude,K_MEAN,varK);
                if i==1 K0=Kxy; end
                if j==1 && k==1 && n==1; Ksy(i)=Kxy; end
                corry(i)=corry(i)+K0*Kxy;
            end
            my=my+Kxy; vy=vy+Kxy*Kxy;
        end
        mx=mx/N; my=my/N; vx=vx/N-mx*mx; vy=vy/N-my*my;
        rmx=rmx+mx; rmy=rmy+my; rvx=rvx+vx; rvy=rvy+vy;
        for i=1:L
            rcorrx(i)=rcorrx(i)+(corrx(i)/N-mx*mx)/vx;
            rcorry(i)=rcorry(i)+(corry(i)/N-my*my)/vy;
        end
    end
    j
end
rmx=rmx/NS; rmy=rmy/NS; rvx=rvx/NS; rvy=rvy/NS;
eval rmx,rmy,rvx,rvy
for i=1:L
    rcorrx(i)=rcorrx(i)/NS; rcorry(i)=rcorry(i)/NS;
    lcx=lcx+rcorrx(i)*dx; lcy=lcy+rcorry(i)*dy;
    lcorrx(i)=lcx; lcorry(i)=lcy;
end

X=1:L; Y=1:L;
figure; plot(X*dx,Ksx,Y*dy,Ksy);
legend('K(x=z,y=const)','K(x=const,y=z)','Location','best'); legend('boxoff');
xlabel('z'); ylabel('K(z)');
figure;
subplot(1,2,1)
plot(X*dx,rcorrx,Y*dy,rcorry);
legend('Longitudinal','Transvere','Location','best'); legend('boxoff');
xlabel('spatial lag'); ylabel('Corrlation function');
set(gca, 'XTick', [0:4:20])
subplot(1,2,2)
plot(X*dx,lcorrx,Y*dy,lcorry);
legend('\lambda_L','\lambda_T','Location','best'); legend('boxoff');
xlabel('spatial lag'); ylabel('Correlation length');
set(gca, 'XTick', [0:4:20])
toc
