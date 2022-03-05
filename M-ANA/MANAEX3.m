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
figure(1);hold on;
plot(t,f);
xlabel('temps $(t)$','interpreter','latex');