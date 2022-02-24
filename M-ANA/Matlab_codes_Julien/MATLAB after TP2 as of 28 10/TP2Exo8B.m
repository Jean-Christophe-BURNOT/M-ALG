clear all;close all;
n=300;
m=n;
[x,y]=meshgrid(1:n,1:m);
[x2,y2]=meshgrid(1:2*n,1:2*m);
[x3,y3]=meshgrid(1:3*n,1:3*m);
M=cos(0.5*x2+0.5*y2);
M2=cos(0.5*x2+0.5*y2);
M3=cos(0.5*x3+0.5*y3);
subplot(1,2,1);
imshow(M3);

TF_M_real = fftshift(fft2(M));
figure(4);imshow(abs(TF_M_real));
TF_M_int = uint8(TF_M_real);
figure(5);imshow(real(TF_M_int));