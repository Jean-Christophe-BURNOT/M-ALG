clear variables;close all;
i=complex(0,1);

% intervalle temporel
tmin=-5;tmax=5;Te=0.001;
t=tmin:Te:tmax;
N=length(t);

% signal f

fonction='a'
switch fonction
  case 'a'
    f=exp(-pi*t.^2).*cos(4*pi*t);
  case 'b'
    t0 = 0;
    a = 1;
    taille=5;
    f=porte(t,t0,a,taille);
  end
figure(1)
plot(t,f,'k'); % affichage (en noir)

% intervalle fréquentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);

% transformée de Fourier (initialisation)
tf= zeros(1,length(nu));

% calcul de la transformée de Fourier (utiliser commande trapz)
for k = 1:N % pour chaque fréquence
  tf(k)=trapz(t, f.*exp(-i*2*pi*nu(k)*t));
end

% affichage
figure(2);
subplot(311);plot(nu,real(tf),'k');xlim([-10,10]);
subplot(312);plot(nu,imag(tf),'k');xlim([-10,10]);
subplot(313);plot(nu,angle(tf),'k');xlim([-10,10]);