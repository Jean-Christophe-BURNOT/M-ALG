clear variables;
close all;
figure(1);hold on;

%génération du plan
%On prend des valeurs
a=2;b=-5;c=1;
%On créer les vecteurs pour les axes
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;

[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2)); % red
C(:,:,2)=0.8*ones(size(Z2)); % green
C(:,:,3)=0.8*ones(size(Z2)); % blue
mesh(X2,Y2,Z2,C);

%génération aléatoire de 10 points
n = 10

a=-2;
b=2;
x=a+(b-a)*rand(n,1)

a=-2;
b=2;
y=a+(b-a)*rand(n,1)

a=-8;
b=6;
z=a+(b-a)*rand(n,1)
figure(1);hold on;
plot3(x,y,z,'.b')
axis equal;



axis([-3,3,-3,3,-8,8])

N = [a;b;c];
N = N/norm(N);
P = eye(size(N,1)) - N*N';
disp(P)
U = [x';y';z'];

V=zeros(3, n);
for k = 1:n
    V(:,k) = P*U(:,k)
end
plot3(V(1,:),V(2,:),V(3,:),'.r')
%On relie les points Pk et Qk