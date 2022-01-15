partie = 'A';
switch partie
case 'A'
        % construction des matrices A et B (SANS BOUCLE FOR NI WHILE)
        A = [1,3,0,0;
            -2,2,3,0;
            0,-2,3,3;
            0,0,-2,4];
        disp(A)

        B = 2.*ones(3,4);
        disp(B)
        
        % concaténation des matrices A et B
        M=[A;B];
        disp(M)
        % décomposition en valeurs singulières de M
        [U,S,V] = svd(M);
        disp(U)
        disp(S)
        disp(V)
        % reconstruction de la matrice M
        M2=zeros(7,4);
        for i = 1:4
            M2 = M2 + S(i,i).*U(:,i)*V(:,i)
        end
        disp(M2)
end

case 'B'
end
    
    
    