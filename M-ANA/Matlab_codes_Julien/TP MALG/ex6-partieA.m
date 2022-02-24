% construction des matrices A et B (SANS BOUCLE FOR NI WHILE)
% A=[1,3,0,0;-2,2,3,0;0,-2,3,3;0,0,-2,4];
A=diag([-2,-2,-2],-1) + diag([1,2,3,4],0) + diag([3,3,3], 1);
B=ones(3,4)*2;
% concaténation des matrices A et B
M=[A;B];

% décomposition en valeurs singulières de M
%M1 = transpose(M)*M;
%N= M * transpose(M);
%[V,D1] = eig(M1);
%[U,D2] = eig(N);
%grec1 = sqrt(D1);
[U,S,V] = svd(M);
% reconstruction de la matrice M
M2=zeros(size(M,1),size(M,2));
for i=1:size(grec1,1)
M2=M2 + S(i,i)*U(:,i)*transpose(V(:,i));
end

