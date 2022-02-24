figure(1);hold on; 
 % intervalle de temps 
 t=0:0.01:2; 
 
  % signal 
  f= exp((-t));
  
  % affichage du signal 
  subplot(121);hold on; 
  plot(t,f,'k','linewidth',2); 
  grid on;axis([0,2,0,1.2]); 
  
  % période et pulsation 
  T=2; 
  omega=2*pi/T; 
  
  % coefficient a0 
  a0= 1/T*trapz(t,f) ; 
  
  % energie totale du signal périodique (initialisation) 
  energie_tot=1/T *trapz(f.^2); 
  
  % nombre d'harmoniques prises en compte 
  N=15; 
  
  % signal reconstruit (initialisation) 
  f_rec= a0;
  
  % énergie du signal reconstruit (initialisation)
  energie_rec= a0^2 ; 
  
  % fréquences des harmoniques (initialisation) 
  freqn_array= zeros(1,N); 
  
  % amplitude des harmoniques (initialisation) 
  An_array=zeros(1,N); 
  
  % calcul du signal reconstruit et de son énergie 
  for n=1:N     
      an=(2/T) * trapz(t, f.*cos(n*omega*t));     
      bn=(2/T) * trapz(t, f.*sin(n*omega*t));
      f_rec= f_rec + (an*cos(n*omega*t) + bn*sin(n*omega*t));    
      energie_rec= energie_rec + (1/2)*(an^2 + bn^2);     
      freqn_array(n)=n*(1/T);     
      An_array(n)=((an^2)+(bn^2))^(1/2); 
  end 
  
  % affichage du signal reconstruit (en superposition du signal d'origine) 
  subplot(121);
  plot(t,f_rec,'r'); 
  xlabel('$t$','interpreter','latex','FontSize',12); 
  lg=legend('$f(t)$','S\''erie de Fourier'); 
  set(lg,'interpreter','latex','FontSize',12); 
  
 % erreur relative sur le calcul d'énergie 
 erreur= energie_tot / energie_rec 
 
  % affichage du spectre 
  subplot(122); 
  bar(freqn_array,An_array); 
  xlabel('$\nu_n$','interpreter','latex','FontSize',12); 
  ylabel('$A_n$','interpreter','latex','FontSize',12);