%série des 1/n² de n=1 à +infini

clear variables;  % efface les variables 
close all; 

question = "2c";

switch question
    case "2a"  
        n = 1
        S = 0
        while n < 16
            n = n+1
            S = S + 1/(n^2)
        end 
    case "2b"
        n=1
        Conv = (pi^2)/6
        S = 0
        while abs(S - Conv) > 1*(10^-3)
            S = S + 1/(n^2)
            n = n + 1
        end
        if S - Conv > 1*(10^-3)
            %text = sprintf("Il faut aller jusqu",n)
            dispo("Il faut aller jusqua",n)
        end
        
        
    case "2c"
        n = 1
        S = 0
        while abs(S - log(2)) > 1*(10^-4)
            
            S = S + (-1)^(n+1)/n
            n = n+1
        end
        if abs(S - log(2)) > 1*(10^-4)
            %text = sprintf("Il faut aller jusqu",n)
            disp("Il faut aller jusqua",n)
        end
            
        
end


 
        
        
        