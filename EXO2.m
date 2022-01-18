clear variables;close all;hold on;


n=5; % nombre de points

x= -3+(3+5)*rand(1,n); % abscisses (vecteur ligne)
y= -4+(4+3)*rand(1,n); % ordonnées (vecteur ligne)
plot(x,y,'ok'); % affichage des points (cercles noirs)

U=[x;y]; % matrice 2xn (concaténation de x et y)

% droite d'équation y=0.5*x
t=[-4,6]; % abscisses
z=t/2; % ordonnées
plot(t,t/2,'k'); % affichage de la droite (trait continu)

% propriétés du repère
axis([-3,5,-4,3]);
grid on;
axis('equal');

% vecteur directeur de la droite z
N=[2;1]./sqrt(5);
% matrice de projections sur la droite z 
P=N*N';

% initialisation de la matrice 2xn contenant les abscisses (1ère ligne)
% et les ordonnées (2ème ligne) des points projetés sur la droite
V=zeros(2,n);

% calcul des coordonnées des points projetés (BOUCLE FOR OBLIGATOIRE)
for k=1:n
 V(:,k)=P*U(:,k);
end

% affichage des points projetés (étoiles)
plot(V(1,:),V(2,:),'*k');

% on relie les points initiaux à leurs projections
for k=1:n
 plot([V(1,k),U(1,k)],[V(2,k),U(2,k)],'k');
end

% on perturbe les coordonnées des points projetés
delta=0.8;
dV=-delta/2+delta*rand(2,n);
W=V+dV;
% affichage des points perturbés (triangles)
plot(W(1,:),W(2,:),'vk');

% calcul de la droite passant au plus près des points perturbés (résolution
% au sens des moindre carrés d’un système Au=v, avec A et v à définir)
A=[W(1,:);1 1 1 1 1];
v=W(2,:);
u=A'\v'; %u est un VECTEUR directeur
% affichage de la droite (en pointillés)
plot(t,t*u(1,:)+u(2,:),'k--');

clear variables;close all;
%% question 1
x=-10:1:10;
y=x;
figure(1);hold on;
a=4;b=9;c=0;d=0;e=0;f=-36;
h=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
set(h,'color','b');

traj=[
-1.2500 3.1780;
 -1.1000 3.0460;
 -0.9320 2.9300;
 -0.7460 2.8340;
 -0.5420 2.7540;
 -0.3200 2.6960;
 -0.0740 2.6580;
 0.1940 2.6420;
 0.4900 2.6540;
 0.7860 2.6980];
 
%on affiche tt les points
plot(traj(:,1)',traj(:,2)','*r')


A=zeros(10,5);
B=zeros(10,1);

for k=1:10
  x=traj(k,1);
  y=traj(k,2);
  A(k,:)=[x^2 x*y x y 1];
  B(k,:)=[y^2];
endfor
A
B
Z=(A'*A)\(A'*B) #Z a 5 valeur car on sait que b=1
#Z=A\B
H=ezplot(@(x,y)myfun(x,y,-Z(1),1,-Z(2),-Z(3),-Z(4),-Z(5)));
set(H,'color','green');


traj2=[-2.5815 0.0847
-2.0762 0.3172
-1.3565 0.6058
-0.5279 0.9590
1.0265 1.2828
2.7484 0.8756
3.5944 0.5226
4.6929 0.1792];
plot(traj2(:,1)',traj2(:,2)','*r');
A2=zeros(8,5);
B2=zeros(8,1);

for k=1:8
  x=traj2(k,1);
  y=traj2(k,2);
  A2(k,:)=[x^2 x*y x y 1];
  B2(k,:)=[y^2];
endfor
Z2=(A2'*A2)\(A2'*B2) #Z a 5 valeur car on sait que b=1
#Z=A\B
H2=ezplot(@(x,y)myfun(x,y,-Z2(1),1,-Z2(2),-Z2(3),-Z2(4),-Z2(5)));
set(H2,'color','yellow');



