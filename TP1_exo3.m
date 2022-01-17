n = 6;
a=-1;
b=2;
T=full(gallery('tridiag',n,a,b,a));

[P,D]=eig(T);

%La valeur propre dominante n'est pas lambda1 car < a lambda2:
D;
D(1,1);
D(2,2);

precision=1/1000;
delta=1;

X=ones(n,1);
X=X/norm(X);
Vp0=0;
VpTab=[Vp0];
Vp=[];
i=0

for k=1:n
X=ones(n,1);
X=X/norm(X);
precision=1/1000;
delta=1;
Vp0=0;
VpTab=[Vp0];
  while delta>precision
    Xk=(T*X);
    Vp1=norm(Xk)/norm(X);
    Xk=Xk/norm(Xk);
    delta=norm(Vp1-Vp0);
    X=Xk;
    Vp0=Vp1;
    i=i+1;
    VpTab=[VpTab,Vp0];
  end
 Vp0
 B=T-(Vp0*(X*X'/norm(X'*X)));
 T=B;
 Vp=[Vp,Vp0];
endfor


i
Vp
T
 

t=[1:length(Vp)];
plot(t,Vp,'*-b');