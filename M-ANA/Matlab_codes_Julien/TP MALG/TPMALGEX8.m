clear variables;
close all;
% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5; % abscisses
0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées
[m,n]=size(F0);
% dimension du cadre d'affichage
L=200;
cadre=[-L,L,-L,L];
% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;

question=2;
switch question
    case 1
      u = [-80; 60];
      nPoints = u*ones(1,n);
      F1 = F0 + nPoints;
      fill(F1(1,:),F1(2,:),[1,0,0]);
      
      N = [sqrt(2)/2;sqrt(2)/2];
      N = N/norm(N);
      S = 2*(N*N') -eye(size(N,1));
      F2=zeros(2,n);
% % calcul des coordonnées des points projetés (BOUCLE FOR OBLIGATOIRE)
     for k= 1:n 
        F2(:,k)=S*F1(:,k);  
     end
     fill(F2(1,:),F2(2,:),[0,1,0]);
     X = [-L,L];
     Y = (1) * X;
     plot(X,Y,'g--');
     
     %angle de rotation
     angle = -2*pi/3;
     R = [cos(angle),-sin(angle);
         sin(angle),cos(angle)];
     F3 = R*F2;
     fill(F3(1,:),F3(2,:),[0,0,1]);
     
     ang=0:0.01:2*pi;
     G2 = [mean(F2(1,:));mean(F2(2,:))];
     r = norm(G2);
     xp=r*cos(ang);
     yp=r*sin(ang);
     plot(xp,yp,'b--');
     
    case 2
     u = [-80; 60];
      nPoints = u*ones(1,n);
      F1 = F0 + nPoints;
      fill(F1(1,:),F1(2,:),[1,0,0]);
      for i = 1:30
          
        N = (j-i).*rand(1,1) + i
        N = N/norm(N);
        S = 2*(N*N') -eye(size(N,1));
        F2=zeros(2,n);
% % calcul des coordonnées des points projetés (BOUCLE FOR OBLIGATOIRE)
        for k= 1:n 
            F2(:,k)=S*F1(:,k);  
        end
        fill(F2(1,:),F2(2,:),[0,1,0]);
      end
    
    case 3

    
end
