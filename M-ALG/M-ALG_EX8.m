clear variables;
close all;

%%
% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5; % abscisses
0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnees
%Permet de definir la taille des vecteurs
[m,n]=size(F0);
% dimension du cadre d'affichage
L=200;
cadre=[-L,L,-L,L];
% affichage du motif de base
color=[0,0,0];
%Affiche la premiere feuille
fill(F0(1,:),F0(2,:),color);
%definit une propriete sur les axes
axis('equal');
%definit la limite des axes
axis(cadre);
%permet de garder les proprietes
hold on;

%%
question=1;
switch question
    case 1
        
        %Cas de la translation
        u=[-80;60];
        %permet de faire la transaltion des vecteurs F0
        F1=F0+u*ones(1,n);
        %definit une couleur RGB
        color = [1,0,0];
        %permet d'afficher notre feuille translate
        %fill prend deux listes de points, les relient et colorent
        %l'interieur
        fill(F1(1,:),F1(2,:),color);     
        %Cas de la Symetrie
        
    case 2
        
    case 3
end