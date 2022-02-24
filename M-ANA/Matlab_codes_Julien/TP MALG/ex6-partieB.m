A = imread('einstein.jpg');
% imshow(A);

A=A(:,:,1);
A = double(A);
[U,S,V] = svd(A);

figure(1);hold on;
tab=[5,40,100,200];
for i=1:4
    Ak=0;
    for j=1:tab(1,i)
        Ak = Ak + S(j,j)*U(:,j)*transpose(V(:,j));
    end
    subplot(4,1,i);
    imshow(uint8(Ak));
end
%tx de comp : 1 - k((1+m+n)/mn)
