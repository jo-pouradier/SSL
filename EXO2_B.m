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











