clear variables; close all;

%creation d'une grille en 3D
figure(1);hold on;
a=2;b=-5;c=1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2)); % red
C(:,:,2)=0.8*ones(size(Z2)); % green
C(:,:,3)=0.8*ones(size(Z2)); % blue
mesh(X2,Y2,Z2,C);

view(-30,30);

%creation des 10 pnts
pnts=10;
Xi = -2+(2+2)*rand(1,pnts); 
Yi = -2+(2+2)*rand(1,pnts);
Zi = -8+(6+8)*rand(1,pnts);
plot3(Xi,Yi,Zi,'.b');

n=[a; b; c]; %vecteur directeur du plan
n=n/norm(n); %on normalise pour creer les matrices voulue
P = eye(3) - n*n'; %projection othogonal
U = [Xi;Yi;Zi]; %n est un tableau des pnts avec leur coords en ligne
V = zeros(3,pnts); %initialisation
for k=1:pnts
    V(:,k)=P*U(:,k); 
end
plot3(V(1,:),V(2,:),V(3,:),'.k'); %V est un tableau des pnt projeter sur le plan

for k=1:pnts
    plot3([V(1,k),U(1,k)],[V(2,k),U(2,k)],[V(3,k),U(3,k)],'k'); %on relie les pnts
end
axis equal;
axis ([-4,4,-4,4,-8,8])



delta=0.5;
dQ=-delta/2+delta*rand(3,pnts); 
Q=V+dQ; %perturbation des points projeter sur le plan
plot3(Q(1,:),Q(2,:),Q(3,:),'vk');

%methode des moindres carrés Ax=b, on trouve les coeff du nouveau plan d'equation : ax + by + cz = 0
A=[Q(1,:)',Q(2,:)']; %[x,y]
b= Q(3,:)';%z
x=(A'*A)\A'*b;

a=x(1,1);b=x(2,1);c=-1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=0.5*ones(size(Z2)); % red
C(:,:,2)=0.2*ones(size(Z2)); % green
C(:,:,3)=0.1*ones(size(Z2)); % blue
mesh(X2,Y2,Z2,C);

n2 = [a; b; c]; %vecteur directeur du deuxieme plan perturbé
n2=n2/norm(n2);
alpha = acos(dot(n,n2)); %angle entre le plan n et n2
alpha
