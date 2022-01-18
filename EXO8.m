clear variables;
close all;
% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5; % abscisses
0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées
[m,n]=size(F0);
% dimension du cadre d'affichage
L=500;
cadre=[-L,L,-L,L];
% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;

question=2;
switch question
    case 1
        %translation
        u=[-80;60]; %vecteur directeur
        F1=[F0(1,:)+u(1,1) ; F0(2,:)+u(2,1)]; %on translate 
        fill(F1(1,:), F1(2,:), 'red');
        
        %symétrie
        N=[sqrt(2)/2;sqrt(2)/2]; %vecteur directeur
        S1=2*(N*N')-eye(2); %matrice de symetrie
        F2=S1*F1; 
        fill(F2(1,:),F2(2,:),'green');
        
        %droite
        X=[-L,L]; %vecteur de la taille de la fenetre
        Y=X*N(1,1) + N(2,1); %creation de la droite a partir de X
        plot(X,Y,'g--')
        
        %rotation
        theta = -2*pi/3; %angle de rotation qu'on veux
        R = [cos(theta) -sin(theta);sin(theta) cos(theta)]; %matrice de rot en 2D
        F3=R*F2;
        fill(F3(1,:),F3(2,:),'blue');
        
        %cercle
        t = 0:0.01:2*pi; %vecteur de pnts 
        G2=mean(F2,2);
        r=norm(G2);
        %creation de l'equation parametrique du cercle
        X=r*cos(t); 
        Y=r*sin(t); 
        plot(X,Y,'b--');

    case 2
        %translation
        u = [-80;60];
        F1=[F0(1,:)+u(1,1);F0(2,:)+u(2,1)];
        fill(F1(1,:),F1(2,:),'red');
        %rotation
        N=30;
        for k=1:N
            r=[-1+2*rand();-1+2*rand()]; 
            r=r/norm(r);
            S1=2*(r*r')-eye(2);
            F2=S1*F1; %symetrie par rapport a une droite passant par l'origine
            fill(F2(1,:),F2(2,:),[rand(),rand(),rand()]);
        end

    case 3
        N=800;
        for k=1:N
            %translation
            u = [-L+2*L*rand();-L+2*L*rand()];
            F1=[F0(1,:)+u(1,1);F0(2,:)+u(2,1)];
            %rotation
            theta=2*pi*rand();
            R = [cos(theta) -sin(theta);sin(theta) cos(theta)];
            F3=R*F1;
            fill(F3(1,:),F3(2,:),[rand(),rand(),0]);
            
        end  
end
