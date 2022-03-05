function[y]= porte(x,t0,a,taille)
    y = taille*((1/a)*abs(x-t0) < 0.5);
end