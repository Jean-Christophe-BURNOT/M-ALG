clear variables;close all;

Question = 'b';
switch Question
    case 'a'
        % intervalle temporel 
        tmin=-4;tmax=4;Te=0.01; 
        t=tmin:Te:tmax; 
        N=length(t);

        %kmin=2;kmax=6;Tk=2;
        %k=kmin:Tk:kmax;
        %k=2;

        %Fonction*
        %alpha2 = (1/2)*2;
        %alpha4 = (1/2)*4;
        %alpha6 = (1/2)*6;
        sigma = 2.^[-2,-4,-6];
        g = zeros(3,N);
        for k=1:3
            g(k,:) = (1/sigma(k)*((2*pi)^1/2)) * exp(-t.^2/(2*sigma(k).^2));

            figure(1); 
            subplot(1,3,k);plot(t,g(k,:),'k');xlim([-5,5]); 

            %g_alpha2 = (1/alpha2*((2*pi)^1/2)) * exp(-t.^2/2*alpha2^2);
            %g_alpha4 = (1/alpha4*((2*pi)^1/2)) * exp(-t.^2/2*alpha4^2);
            %g_alpha6 = (1/alpha6*((2*pi)^1/2)) * exp(-t.^2/2*alpha6^2);

        end

        %Fréquence
        ve = 1/Te;
        ve_e=linspace(-ve/2,ve/2,N);


        %Transfo de Fourier
        tf = zeros(3,length(ve_e)); %initialisation
        %tf4 = zeros(3,length(ve_e)); %initialisation
        %tf6 = zeros(3,length(ve_e)); %initialisation
        % calcul de la transformée de Fourier (utiliser commande trapz) 
        for k=1:3
            for u= 1:N % pour chaque fréquence  
                tf(u,:)= trapz(t, g(k,:).*exp(-1i*2*pi*ve_e(u)*t));
                %(u)= trapz(t, g(k,:).*exp(-1i*2*pi*ve_e(u)*t));
                %tf6(u)= trapz(t, g(k,:).*exp(-1i*2*pi*ve_e(u)*t));

            end 
            figure(2);
            subplot(1,3,k);plot(ve_e,tf(u,:),'k');xlim([-50,50]); 
            %subplot(13,u);plot(ve_e,tf4(u,:),'k');xlim([-50,50]); 
            %subplot(13,u);plot(ve_e,tf6(u,:),'k');xlim([-50,50]);


        end

        %affichage
        %figure(1); 
        %subplot(131);plot(t,g,'k');xlim([-5,5]); 
        %subplot(132);plot(t,g,'k');xlim([-5,5]); 
        %subplot(133);plot(t,g,'k');xlim([-5,5]);




    case 'b'
        % intervalle temporel 
        tmin=-4;tmax=4;Te=0.01; 
        t=tmin:Te:tmax; 
        N=length(t);
        
        %Fréquence
        ve = 1/Te;
        ve_e=linspace(-ve/2,ve/2,N);
        
        %Fonction S
        u0 = 5;
        s= exp(-pi*(t.^2)).*cos(2*pi*(u0)*t);

        tf0 = zeros(1,length(ve_e)); %initialisation
        % calcul de la transformée de Fourier (utiliser commande trapz) 
        for k= 1:length(ve_e) % pour chaque fréquence  
            ts(k)= trapz(t, s.*exp(-1i*2*pi*ve_e(k)*t));

        end 
        
        sigma = 2.^[-2,-4,-6];
        k=6;
        y = zeros(3,N);
        %g = zeros(3,N);
        g=(1/((1/2)^k*((2*pi)^1/2))) * exp(-t.^2/((2*(1/2)^k).^2));
        %for k=1:3
            %g(k,:) = (1/sigma(k)*((2*pi)^1/2)) * exp(-t.^2/(2*sigma(k).^2));
            convo = Te.*conv(s,g,'same');
            figure(1);hold on;
            subplot(1,1,1);plot(t,s,'b');xlim([-5,5]);
            subplot(1,1,1);plot(t,convo,'r');xlim([-5,5]);
        %end
        figure(2);
        subplot(1,2,1);plot(t,s,'k');xlim([-5,5]);
        subplot(1,2,2);plot(ve_e,ts,'k');xlim([-10,10]);
end