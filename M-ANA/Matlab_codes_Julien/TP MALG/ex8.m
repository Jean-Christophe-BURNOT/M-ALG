clear variables;
close all;
% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5; % abscisses
0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées
[m,n]=size(F0);
% dimension du cadre d'affichage
L=200;
cadre=[-L,L,-L,L];
% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;

question=3;
switch question
case 1
    F1 = F0+[-80;60];
    color=[1,0,0];
    fill(F1(1,:),F1(2,:),color);
    
    n = [1/sqrt(2);1/sqrt(2)];
    S = 2*(n*n') - eye(size(n,1));
    F2 = S*F1;
    color=[0,1,0];
    fill(F2(1,:),F2(2,:),color);
    X = -L:0.01:L;
    Y = (1/sqrt(2))*X;
    plot(X,Y,'--g');
    
    angle = -2*pi/3;
    R = [cos(angle), -sin(angle); sin(angle), cos(angle)];
    F3 = R*F2;
    color=[0,0,1];
    fill(F3(1,:),F3(2,:),color);
    
    r=norm([mean(F2(1,:));mean(F2(2,:))]);
    th = 0:pi/50:2*pi;
    xunit = r * cos(th);
    yunit = r * sin(th);
    h = plot(xunit, yunit,'--b');
case 2
    N=100;
    F1 = F0+[-80;60];
    color=[1,0,0];
    fill(F1(1,:),F1(2,:),color);
    for i=1:N
        n = [2*rand()-1;2*rand()-1];
        n = n/norm(n);
        S = 2*(n*n') - eye(size(n,1));
        F2 = S*F1;
        color=[rand(),rand(),rand()];
        fill(F2(1,:),F2(2,:),color);
    end

case 3
    N = 500;
    F1 = F0+[-80;60];
    color=[1,0,0];
    fill(F1(1,:),F1(2,:),color);
    for i=1:N
        angle = rand()*2*pi;
        R = [cos(angle), -sin(angle); sin(angle), cos(angle)];
        F3 = R*F1;
        
        F3 = F3 + [(2*rand()-1)*L; (2*rand()-1)*L];
        color=[rand(),rand(),0];
        fill(F3(1,:),F3(2,:),color);
        
        
    end
end