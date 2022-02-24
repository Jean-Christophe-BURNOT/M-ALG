clear variables;close all;
n=300;
r = 300;
m=n;
figure(1);
x=-n/2:n/2;
y=x;
lx=45;
ly=20;
M1=porte_2d(m,n,lx,ly);
M2 = disque(n,m,r);
subplot(1,2,1);
figure(2);
imshow(M1);
figure(3);
imshow(M2);

TF_M_real = fftshift(fft2(M2));
figure(4);
imshow(abs(TF_M_real))
TF_M_int = uint8(TF_M_real);
figure(5);
imshow(TF_M_int);




