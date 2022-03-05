function[y] = triangle(x,t0,a,taille)
  y=taille.*((1-abs((x.*1/a)-t0)).*(abs((x.*1/a)-t0)<1)); 
end