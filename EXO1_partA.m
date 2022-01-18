
A=[1 -2 3 1 ; 2 5 -1 3; 4 1 0 2 ; 0 -2 3 1];

%affichage de la 3eme colonne:
A(:,3)
%affichage de la 4eme ligne:
A(4,:)


%changement de la 3eme colonne
A(:,3)=[1 1 1 1];
A


%Trace de A:
trace(A)


%resolution du systeme Ax=b:  Utilisation de: "\"
b=[1 2 -1 3]';
A\b


B=A(:,2:3);
C=A([1 3],:);
D=A(2:4,2:4);


M=C*C'
[P,D]=eig(M)
%verifier que P est ortho:
P*P'  %==Identité


