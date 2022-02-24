clear variables;  % efface les variables 
close all; 

question = "3a";

switch question
    case "3a" 
       X = 0:(1/1000):1;
       Y = (X+3)./((2*X)+1)^(1/2);
       Z = trapz(X,Y);
       R = 3*(3)^(1/2) - 8/3;
       disp(abs(R-Z));
end