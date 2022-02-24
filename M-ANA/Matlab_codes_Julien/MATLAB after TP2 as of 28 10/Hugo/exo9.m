clear variables;close all; 
A=imread('barbara.jpg'); 
[a,b]=size(A); 
figure(1); 
subplot(2,2,1); 
imagesc(A); 
colormap gray;

TF_A = fftshift(fft2(A));
subplot(2,2,3);
imagesc(log10(abs(TF_A)));

FILT_A = (1-disque(a,b,60)).*TF_A;
subplot(2,2,4);
imagesc(log10(abs(FILT_A)));

A = ifft2(FILT_A);
subplot(2,2,2);
imagesc(abs(A));
