clear;
close all;

Te = 0.01;
tmin=-5;
tmax=5;
t = tmin:Te:tmax;
nu1 = 20;
nu2 = 45;

f0 = exp(-5*pi*(t-1).^2);
f1 = 0.05*sin(2*pi*nu1*t) + 0.02*sin(2*pi*nu2*t);
f = f0 + f1;

figure(1);
plot(t,f);

nue = 1/Te;
numin=-nue/2;
numax=nue/2;
nu = numin:Te:numax;

N=length(nu);
% transform�e de Fourier (initialisation)
tf=zeros(1,N);

i=complex(0,1);
% calcul de la transform�e de Fourier (utiliser commande trapz) 
for k=1:N % pour chaque fr�quence  
    tf(k)=trapz(t,f.*exp(-2*i*pi*nu(k)*t));
end

% affichage 
figure(1); 
subplot(131);plot(t,f,'k');xlim([tmin,tmax]);
title('signal bruité');
xlabel('temps (t)','interpreter','latex','FontSize',12);
subplot(132);plot(nu,real(tf),'k','color','r');xlim([numin,numax]);
title('TF (real)');
xlabel('frequence ($\nu_n$)','interpreter','latex','FontSize',12);
subplot(133);plot(nu,imag(tf),'k','color','b');xlim([numin,numax]);
title('TF (imag.)');
xlabel('frequence ($\nu_n$)','interpreter','latex','FontSize',12);

% Supression du bruit par une porte
for k=1:N % pour chaque fr�quence  
    tf(k)=tf(k).*porte((1/80)*nu(k)); 
end

Nt=length(t);
% Calcul TFI
% transform�e de Fourier inverse (initialisation) 
tfi=zeros(1,Nt);

% calcul de la transform�e de Fourier (utiliser commande trapz) 
for k=1:Nt % pour chaque fr�quence  
    tfi(k)=trapz(nu,tf.*exp(2*i*pi*nu*t(k)));
end 

% affichage 
figure(2); 
subplot(131);plot(t,tfi,'k');xlim([tmin,tmax]);
title('TF inverse');
xlabel('temps (t)','interpreter','latex','FontSize',12);
subplot(132);plot(nu,real(tf),'k','color','r');xlim([numin,numax]);
title('TF ap. filt. (real)');
xlabel('frequence ($\nu_n$)','interpreter','latex','FontSize',12);
subplot(133);plot(nu,imag(tf),'k','color','b');xlim([numin,numax]);
title('TF ap. filt. (imag.)');
xlabel('frequence ($\nu_n$)','interpreter','latex','FontSize',12);