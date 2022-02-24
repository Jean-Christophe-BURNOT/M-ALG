clear variables;close all;
% intervalle temporel 
tmin=-5;tmax=5;Te=0.01; 
t=tmin:Te:tmax; 
N=length(t); 
u1 = 20;
u2 = 45;

%Fréquence
ve = 1/Te;
ve_e=linspace(-ve/2,ve/2,N); 
%vemin= -ve/2;Te;vemax=ve/2;


%Fonctions
%f0 = triangularPulse(1);
f0 = exp(-5*pi*((t-1).^2));
f1 = 0.05*cos(2*pi*u1*t) + 0.02*cos(2*pi*u2*t);

f = f0 + f1;


%Transfo de fourier
tf = zeros(1,length(ve_e)); %initialisation
% calcul de la transformée de Fourier (utiliser commande trapz) 
for k= 1:length(ve_e) % pour chaque fréquence  
    tf(k)= trapz(t, f.*exp(-1i*2*pi*ve_e(k)*t));
    
end 


%Pour filter les sup à 2.5Hz on multiplie par une porte 5 fois plus large
tfFiltre = rectangularPulse(ve_e/30).*tf;

tfFiltreInverse = zeros(1,N);

for k= 1:N % pour chaque fréquence  
    tfFiltreInverse(k)= trapz(ve_e, tfFiltre.*exp(1i*2*pi*ve_e*t(k)));
    
end 










% affichage 
figure(1);hold on; 
plot(t,f); 
xlabel('temps $(t)$','interpreter','latex');


figure(2); 
subplot(321);plot(ve_e,real(tf),'k');xlim([-50,50]); 
subplot(322);plot(ve_e,imag(tf),'k');xlim([-50,50]); 
subplot(323);plot(ve_e,(tf),'k');xlim([-50,50]);


figure(1);
% plot(t,tfFiltreInverse,'k'); 
% xlabel('temps $(t)$','interpreter','latex');
plot(t,real(tfFiltreInverse),'r'); 


figure(3); 
subplot(321);plot(ve_e,real(tfFiltre),'k');xlim([-50,50]); 
subplot(322);plot(ve_e,imag(tfFiltre),'k');xlim([-50,50]); 
subplot(323);plot(ve_e,(tfFiltre),'k');xlim([-50,50]);





