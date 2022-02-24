clear variables;
close all;
figure(1);hold on;
a=2;b=-5;c=1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2)); % red
C(:,:,2)=0.8*ones(size(Z2)); % green
C(:,:,3)=0.8*ones(size(Z2)); % blue
mesh(X2,Y2,Z2,C);
axis equal;
axis([-3,3,-3,3,-8,8]);
N = [a;b;c];
N = N/norm(N);
P = eye(size(N,1)) - N*transpose(N);

n = 10;
X = rand(1,n)*4 - 2;
Y = rand(1,n)*4 - 2;
Z = rand(1,n)*14 - 8;
U = [X;Y;Z];
plot3(U(1,:),U(2,:),U(3,:), '.g');

delta=0.8;
V=zeros(3,n);
W=zeros(3,n);
for k=1:n
    V(:,k) = P*U(:,k);
    W(:,k) = V(:,k) + (rand(3,1)*delta - delta/2)   ;
end

% Moindres carrés
W = W';
A = W(:,1:2);
v = W(:,3);
u = (A'*A)\(A' * v);

a = -u(1,1);
b = -u(2,1);
c = 1;

x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2)); % red
C(:,:,2)=0.1*ones(size(Z2)); % green
C(:,:,3)=0.1*ones(size(Z2)); % blue
mesh(X2,Y2,Z2,C);

N2 = [a;b;c];
N2 = N2/norm(N2);
angle = acos(sum(N.*N2)); % en radians
if angle>pi/2
    angle = pi - angle;
end
angle = angle*180/pi;

plot3(V(1,:),V(2,:),V(3,:), '.r');
for k=1:n
   plot3([U(1,k),V(1,k)],[U(2,k),V(2,k)],[U(3,k),V(3,k)]);
end





deltas=[];
angles=[];

for delta=0:0.001:1
W=zeros(3,n);
for k=1:n
    W(:,k) = V(:,k) + (rand(3,1)*delta - delta/2);
end

% Moindres carrés
W = W';
A = W(:,1:2);
v = W(:,3);
u = (A'*A)\(A' * v);

a = -u(1,1);
b = -u(2,1);
c = 1;

N2 = [a;b;c];
N2 = N2/norm(N2);
angle = acos(sum(N'*N2)); % en radians
if angle>pi/2
    angle = pi - angle;
end
angle = angle*180/pi;
deltas= [deltas delta];
angles = [angles angle];
end

figure(3);
plot(deltas,angles);
legend('angle(bruit)');

