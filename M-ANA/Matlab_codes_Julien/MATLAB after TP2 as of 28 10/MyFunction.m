% Fonction MyFunction 
% Calcule le produit scalaire (r1) et les produits 
% matriciels (r2 et r3) de deux vecteurs (a et b) 
function [r1,r2,r3]=MyFunction(a,b) 
 
if length(a)~=length(b) 
    error('Les vecteurs doivent être de même longueur !'); 
end 
r1=sum(a.*b);  % produit scalaire (remarquer le '.' devant '*') 
r2=a'*b;       % produit matriciel 1 (ici pas de '.') 
r3=a*b';       % produit matriciel 2 (idem)