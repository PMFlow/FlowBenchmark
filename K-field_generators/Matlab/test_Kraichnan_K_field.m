clear all;
close all
tic
global state;
initstate; state;
NMOD=100;
varK=0.1;
K_MEAN=15;
lambda=0.0;
ZC1=2.0;
ZC2=1.0;
dx=0.1; dy=0.1; Lx=100; Ly=100;
Kfield=zeros(Lx,Ly);
for k=1:2
    if k==1
        [wavenum, phi, amplitude] = ...
            Kraichnan_Exp_param(NMOD,varK,ZC1,ZC2,lambda);
    else
        [wavenum, phi, amplitude] = ...
            Kraichnan_Gauss_param(NMOD,varK,ZC1,ZC2,lambda);
    end
    for i=1:Lx
        for j=1:Ly
            x=i*dx; y=j*dy;
            Kxy=Kraichnan_func(x,y,wavenum,...
                phi,amplitude,K_MEAN,varK);
            Kfield(i,j)=Kxy;
        end
    end
    str='Exp'; if k==2; str='Gauss'; end
    lgd(1:length(str))=str;
    X=0.1:dx:Lx*dx; Y=0.1:dy:Ly*dy;
    figure(1);
    subplot(1,2,k)
    mesh(X,Y,Kfield); colormap(jet); shading interp;
    xlabel('x'); ylabel('y');
    set(gca, 'XTick',0:2:10); set(gca,'YTick',0:2:10);
    leg=legend(lgd,'Location','northwest');
    leg.FontSize = 8;
    figure(2);
    subplot(1,2,k)
    contour(X,Y,Kfield/max(max(Kfield)))
    xlim([0 10]); ylim([0 10]);
    xlabel('x'); ylabel('y');
    set(gca, 'XTick',0:2:10); set(gca,'YTick',0:2:10);
    leg=legend(lgd,'Location','northwest');
    leg.FontSize = 8;
end
toc
