

clear variables;close all; 
i=complex(0,1); 
         
% intervalle temporel  
tmin=-5;
tmax=5;
Te=0.01; 
t=tmin:Te:tmax; 
N=length(t); 
 
% signal f         
f=exp(-pi*t.^2).*cos(4*pi*t) 
plot(t,f,'k');  % affichage (en noir) 
 
         
% intervalle fr�quentiel 
nu_e=1/Te; 
nu=linspace(-nu_e/2,nu_e/2,N); 
 
% transform�e de Fourier (initialisation) 
tf= 0  
         
% calcul de la transform�e de Fourier (utiliser commande trapz) 
for k= 1:N % pour chaque fr�quence  
    tf(k)= trapz(t, f.*exp(-i*2*pi*nu(k)*t)) 
end 
         
% affichage 
figure(1); 
subplot(311);plot(nu,real(tf),'k');xlim([-10,10]); 
subplot(312);plot(nu,imag(tf),'k');xlim([-10,10]); 
subplot(313);plot(nu,angle(tf),'k');xlim([-10,10]); 









% clear variables;close all; 
% i=complex(0,1); 
%          
% % intervalle temporel  
% tmin=-5;
% tmax=5;
% Te=0.01; 
% t=tmin:Te:tmax; 
% N=length(t); 
%  
% % signal f         
% f= t*rectangularPulse(t)
% plot(t,f,'k');  % affichage (en noir) 
%  
%          
% % intervalle fr�quentiel 
% nu_e=1/Te; 
% nu=linspace(-nu_e/2,nu_e/2,N); 
%  
% % transform�e de Fourier (initialisation) 
% tf= 0  
%          
% % calcul de la transform�e de Fourier (utiliser commande trapz) 
% for k= 1:N % pour chaque fr�quence  
%     tf(k)= trapz(t, f.*exp(-i*2*pi*nu(k)*t)) 
% end 
%          
% % affichage 
% figure(1); 
% subplot(311);plot(nu,real(tf),'k');xlim([-10,10]); 
% subplot(312);plot(nu,imag(tf),'k');xlim([-10,10]); 
% subplot(313);plot(nu,angle(tf),'k');xlim([-10,10]); 