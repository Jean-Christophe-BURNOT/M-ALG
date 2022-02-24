clear;
close all;

Te=2^(-12);
D=1;
t=-D:Te:D-Te;

T1 = 2^(-5);
T2 = 2^(-6);

p1 = peigne(T1,t);
p2 = peigne(T2,t);

[tfp1,nu1] = TransFourier(p1,t);
[tfp2,nu2] = TransFourier(p2,t);

% affichage 
figure(1); 
subplot(221);plot(t,tfp1,'k');
title('Peigne de Dirac ({\it p(t)})');
xlabel('temps (t)','interpreter','latex','FontSize',12);
subplot(223);plot(t,tfp2,'k');
title('Peigne de Dirac ({\it p(t)})');
xlabel('temps (t)','interpreter','latex','FontSize',12);
subplot(222);plot(nu1,real(tfp1),'k');
title('TF(p(t))');
xlabel('frequence (Hz)','interpreter','latex','FontSize',12);xlim([-1000,1000]);
subplot(224);plot(nu2,real(tfp2),'k');
title('TF(p(t))');
xlabel('frequence (Hz)','interpreter','latex','FontSize',12);xlim([-1000,1000]);

nu0 = 5;
s = exp(-pi*t.^2).*cos(2*pi*nu0*t);

z = s .* p2;

[tfs,nus] = TransFourier(s,t);
[tfz,nuz] = TransFourier(z,t);

% affichage 
figure(2); 
subplot(311);plot(t,s,'k');hold on;plot(t,z,'.r');
legend('{\it s(t)}','{\it z(t)}');
xlabel('temps (t)','interpreter','latex','FontSize',12);
subplot(312);plot(nus,real(tfs),'k');
title('TF(s(t))');
xlabel('frequence (Hz)','interpreter','latex','FontSize',12);xlim([-50,50]);
subplot(313);plot(nuz,real(tfz),'k');
title('TF(z(t))');
xlabel('frequence (Hz)','interpreter','latex','FontSize',12);xlim([-500,500]);