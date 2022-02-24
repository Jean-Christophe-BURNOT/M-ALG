clear variables;close all;
tmin=-5;tmax=5;Te=0.01; 
t=tmin:Te:tmax; 
N=length(t);

f = rectangularPulse(t);
g = f;
convo = Te.*conv(f,g,'same');


figure(1); hold on;
subplot(121);hold on; 
plot(t,f,'k','linewidth',2); 
grid on;axis([-2,2,0,1.2]);

subplot(122); 
plot(t,g,'k','linewidth',2); 
grid on;axis([-2,2,0,1.2]);


figure(2);
subplot(311);
x = linspace(tmin,tmax,length(convo));
plot(x,real(convo),'k','linewidth',2); 





% intervalle fréquentiel 
nu_e=1/Te; 
nu=linspace(-nu_e/2,nu_e/2,N);


tf = zeros(1,length(nu));
for k= 1:length(nu) % pour chaque fréquence  
    tf(k)= trapz(t, f.*exp(-1i*2*pi*nu(k)*t));
    
end 

tg = zeros(1,length(nu));
for k= 1:length(nu) % pour chaque fréquence  
    tg(k)= trapz(t, g.*exp(-1i*2*pi*nu(k)*t));
    
end 

FG = tg.*tf;

FGInverse = zeros(1,N);

for k= 1:N % pour chaque fréquence  
    FGInverse(k)= trapz(nu, FG.*exp(1i*2*pi*nu*t(k)));
    
end 

figure(3);
plot(t,real(FGInverse))
