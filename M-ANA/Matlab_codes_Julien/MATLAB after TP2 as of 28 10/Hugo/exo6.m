clear;
close all;

partie = 'B2';
    
switch partie
    case 'A'
        Te = 0.005;
        tmin=-5;
        tmax=5;
        t = tmin:Te:tmax;
        Nt=length(t);

        k=[2,4,6];
        sigma=[0.5,2,4];
        sigma=(2.^(-k));
        Nsigma = length(sigma);
        gsigma=zeros(Nsigma,Nt);
        for l = 1:Nsigma
           gsigma(l,:) = (1/(sigma(l)*((2*pi).^0.5))) .* exp(-(t.^2)/(2*(sigma(l).^2)));
           %gsigma(l,:) = porte((1/sigma(l))*t);
        end
        
        nue = 1/Te;
        numin=-nue/2;
        numax=nue/2;
        nu = numin:Te:numax;

        N=length(nu);
        % transform�e de Fourier (initialisation)
        tf=zeros(Nsigma,N);

        i=complex(0,1);
        % calcul de la transform�e de Fourier (utiliser commande trapz)
        for l=1:Nsigma
            for k=1:N % pour chaque fr�quence  
                tf(l,k)=trapz(t,gsigma(l,:).*exp(-2*i*pi*nu(k)*t));
            end
        end

        % affichage 
        figure(1);
        for l=1:Nsigma
            subplot(2,Nsigma,l);plot(t,gsigma(l,:),'k');xlim([tmin,tmax]);
            title(strcat('\sigma = ', num2str(sigma(l))));
            xlabel('temps (t)','interpreter','latex','FontSize',12);
        end;
        for l=1:Nsigma
            subplot(2,Nsigma,l+Nsigma);plot(nu,real(tf(l,:)),'k','color','b');xlim([numin,numax]);
            title(strcat('\sigma = ', num2str(sigma(l))));
            xlabel('frequence ($\nu_n$)','interpreter','latex','FontSize',12);
        end
        
    case 'B'
        Te = 0.01;
        tmin=-4;
        tmax=4;
        t = tmin:Te:tmax;
        nu0 = 5;

        f = exp(-pi*t.^2) .* cos(2*pi*nu0*t);

        nue = 1/Te;
        numin=-nue/2;
        numax=nue/2;
        nu = numin:Te:numax;

        N=length(nu);
        % transform�e de Fourier (initialisation)
        tf=zeros(1,N);

        i=complex(0,1);
        % calcul de la transform�e de Fourier (utiliser commande trapz) 
        for k=1:N % pour chaque fr�quence  
            tf(k)=trapz(t,f.*exp(-2*i*pi*nu(k)*t));
        end

        % affichage 
        figure(1); 
        subplot(121);plot(t,f,'k');xlim([tmin,tmax]);
        title('s(t)');
        xlabel('temps (t)','interpreter','latex','FontSize',12);
        subplot(122);plot(nu,real(tf),'k','color','r');xlim([-10,10]);ylim([0,0.6]);
        title('TF(s(t))');
        xlabel('frequence ($\nu_n$)','interpreter','latex','FontSize',12);
        
    case 'B2'
        Te = 0.01;
        tmin=-5;
        tmax=5;
        t = tmin:Te:tmax;
        Nt=length(t);
        nu0 = 5;

        f = exp(-pi*t.^2) .* cos(2*pi*nu0*t);

        k=[2,4,6];
        %sigma=[0.5,2,4];
        sigma=(2.^(-k));
        Nsigma = length(sigma);
        gsigma=zeros(Nsigma,Nt);
        ysigma=zeros(Nsigma,Nt);
        for l = 1:Nsigma
           gsigma(l,:) = (1/(sigma(l)*((2*pi).^0.5))) .* exp(-(t.^2)/(2*(sigma(l).^2)));
           ysigma(l,:) = Te.*conv(f,gsigma(l,:),'same');
           %gsigma(l,:) = porte((1/sigma(l))*t);
        end

        % affichage 
        figure(1);
        for l=1:Nsigma
            subplot(Nsigma,1,l);hold on;xlim([tmin,tmax]);
            plot(t,f,'k');plot(t,ysigma(l,:)/max(ysigma(l,:))); hold on;
            legend('{\it s(t)}',strcat('{\it y_\sigma(t),\sigma} =', num2str(sigma(l))));
            xlabel('temps (t)','interpreter','latex','FontSize',12);
        end;    
end