clear variables;close all; 

figure = 'cercle';

switch figure
    case 'porte'
        n=300;  
        m=n;
        x=-n/2:n/2; 
        y=x; 
        lx=50; 
        ly=100; 
        M1=porte_2d(m,n,lx,ly);
        figure(1);
        subplot(1,2,1); 
        imshow(M1);

        TF_M_real = abs(fftshift(fft2(M1)));
        subplot(1,2,2);
        imshow(uint8(TF_M_real));
    case 'cercle'
        n=300;
        m=n;
        r=10;
        M1 = disque(n,m,r);
        figure(1);
        subplot(1,2,1);
        imshow(M1);

        TF_M_real = abs(fftshift(fft2(M1)));
        subplot(1,2,2);
        imshow(uint8(TF_M_real));
    case 'periodique'
        clear all;close all; 
        n=300;  
        m=n;
        
        [x,y]=meshgrid(1:n,1:m); 
        M=cos(0.5*x+0.5*y); 
        subplot(231); 
        imshow(M);
        subplot(234);
        TF_M=fftshift(fft2(double(M)));
        imshow(uint8(abs(TF_M)));
        
        [x,y]=meshgrid(1:n,1:m); 
        M=sin(0.8*x+0.2*y); 
        subplot(232); 
        imshow(M);
        subplot(235);
        TF_M=fftshift(fft2(double(M)));
        imshow(uint8(abs(TF_M)));
        
        [x,y]=meshgrid(1:n,1:m); 
        M=cos(1.5*x+1.5*y); 
        subplot(233); 
        imshow(M);
        subplot(236);
        TF_M=fftshift(fft2(double(M)));
        imshow(uint8(abs(TF_M)));
end;