clear variables;close all;

% intervalle temporel
tmin=-5;tmax=5;Te=0.01;
t=tmin:Te:tmax;
N=length(t);

% lorentzienne
f0=(1+(t+1).^2).^(-1);

% signal bruité (bruit gaussien)
f=f0+0.05*randn(1,N);

% affichage
figure(1);
plot(t,f);
xlabel('temps $(t)$','interpreter','latex');

% intervalle fréquentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N)

% transformée de Fourier (initialisation)
tf= zeros(1,length(nu));

% calcul de la transformée de Fourier (utiliser commande trapz)
for k = 1:N % pour chaque fréquence
  tf(k)=trapz(t, f.*exp(-i*2*pi*nu(k)*t));
end

%affiche la transformée de Fourrier
figure(2);
subplot(121);plot(nu,real(tf));
subplot(122);plot(nu,imag(tf));

%filtrage du signal
%Creation d'une fonction porte adéquate
taille=1;
a=10;
t0=0;
p=porte(t,t0,a,taille);
figure(3);
plot(t,p);

%multiplication du signal
tff=tf.*p;

%affichage
figure(4);
subplot(121);plot(nu,real(tff));
subplot(122);plot(nu,imag(tff));

%reconstruction du signal temporel après filtrage dans le domaine de fourier
for k = 1:N;
  frec(k)=trapz(nu,tff.*exp(i*2*pi*nu*t(k)));
end;

figure(5);
plot(t,frec)

%superposition des deux signaux

figure(6);hold on;
plot(t,f);
plot(t,frec,'r');