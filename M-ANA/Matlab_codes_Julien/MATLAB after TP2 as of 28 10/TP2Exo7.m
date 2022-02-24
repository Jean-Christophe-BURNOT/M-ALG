clear variables;close all;
% intervalle temporel 
D=1;Te=2^(-12); 
t=-D:Te:D-Te; 
N=length(t);

%Fréquence
ve = 1/Te;
ve_e=linspace(-ve/2,ve/2,N);

T1 = 2^(-5); %période du peigne
T2 = 2^(-6); %période du peigne
p1 = peigne(T1,t); %peigne 1
p2 = peigne(T2,t); %peigne 2
N=length(t); 
P1 = TransFourier(p1,t);
P2 = TransFourier(p2,t);

figure(1);
subplot(2,2,1);plot(t,p1);
subplot(2,2,3);plot(t,p2);
subplot(2,2,2);plot(ve_e,P1);xlim([-1000,1000]);
subplot(2,2,4);plot(ve_e,P2);xlim([-1000,1000]);



%fonction
u0 = 5;
s= exp(-pi*(t.^2)).*cos(2*pi*(u0)*t);
z= s.*p2;
zPoints = (z/max(z));
%Transfos
S = TransFourier(s,t);
Z = TransFourier(z,t);
figure(2);hold on;
subplot(3,1,1);hold on;plot(t,s,'b');xlim([-1,1]);
subplot(3,1,1);hold on;plot(t,zPoints,'r');xlim([-1,1]);
subplot(3,1,2);plot(ve_e,S);xlim([-50,50]);
subplot(3,1,3);plot(ve_e,Z);xlim([-500,500]);
