clear variables;  % efface les variables 
close all;        % ferme toutes les fenêtres 
% implémentation de la fonction ? ????2 cos2(2?) sous forme de fonction  
% anonyme  
f=@(x)(exp(-x/2).*cos(2*x).^2);  % f est le nom de la fonction, 
                                 % x est le paramètre d’entrée 
 
x=0:0.01:2*pi;    % vecteur ligne dont les composantes vont de 
                  % 0 à 2? avec un pas de 0.01 
 
y=f(x);           % appel de la fonction anonyme f, on obtient un 
                  % vecteur ligne de même dimension que x 
                  % Les composantes de y sont les images  
                  % des composantes de x par la fonction 
                  % ? ????2 cos2(2?) 
  
plot(x,y,'color','b','linewidth',2);  % affiche la courbe de la  
                                      % fonction ? ????2 cos2(2?) sur  
                                      % l’intervalle [0,2?] 
grid on;          % affiche un quadrillage