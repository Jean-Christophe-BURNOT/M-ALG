clear variables;close all;hold on;
part = 'B'
switch part
case 'A'
  n=5; % nombre de points
  x=-3+8*rand(1,n); % abscisses (vecteur ligne)
  y=-4+7*rand(1,n); % ordonn�es (vecteur ligne)
  plot(x,y,'ok'); % affichage des points (cercles noirs)
  U=[x;y];
  disp(U); % matrice 2xn (concat�nation de x et y)
  % droite d'�quation y=0.5*x
  t=[-4,6]; % abscisses
  z=t/2; % ordonn�es
  plot(t,z,'k'); % affichage de la droite (trait continu)
  % propri�t�s du rep�re
  axis([-3,5,-4,3]);
  grid on;
  axis('equal');
  % vecteur directeur de la droite
  N=[2;1]/norm([2,1]);
  % matrice de projections sur la droite
  P=N*N';
  % initialisation de la matrice 2xn contenant les abscisses (1�re ligne)
  % et les ordonn�es (2�me ligne) des points projet�s sur la droite
  V=zeros(2,n);
  % calcul des coordonn�es des points projet�s (BOUCLE FOR OBLIGATOIRE)
  for k=1:n
    V(:,k)=P*U(:,k);
  end
  % affichage des points projet�s (�toiles)
  plot(V(1,:),V(2,:),'*k');
  % on relie les points initiaux � leurs projections
  for k=1:n
    plot([U(1,k),V(1,k)],[U(2,k),V(2,k)],'k');
  end
  % on perturbe les coordonn�es des points projet�s
  delta=0.8;
  dV=-delta+2*delta*rand(2,n);
  W=V+dV;
  % affichage des points perturb�s (triangles)
  plot(W(1,:),W(2,:),'vr');
  % calcul de la droite passant au plus pr�s des points perturb�s (r�solution % au sens des moindre carr�s d�un syst�me Au=v, avec A et v � d�finir)
  A=[W(1,:)',ones(n,1)];
  v=W(2,:)';
  u=(A'*A)\(A'*v);
  % affichage de la droite (en pointill�s)
  plot(t,u(2)+t*u(1),'r--');
case 'B'
  clear variables;close all;
  %% question 1
  x=-5:1:5;
  y=x;
  figure(1);
  a=4;b=9;c=0;d=0;e=0;f=-36;
  h=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
  set(h,'color','k');
  
  
end
  