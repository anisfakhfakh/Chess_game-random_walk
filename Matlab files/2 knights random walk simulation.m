clc;
clear all;
A=zeros(8,8);
A(1:2:8, 1:2:8)=1; %Échiquier 
A(2:2:8, 2:2:8)=1; %Échiquier
B=zeros(8,8);
B(1:2:8, 1:2:8)=1; %Échiquier2 utiliser de la recoloration
B(2:2:8, 2:2:8)=1; %Échiquier2 utiliser de la recoloration
i=1;%Position initial de cavalier sur l'axe des i
j=1;%Position initial de cavalier sur l'axe des j
i1=1;
j1=8;
M=10;%Nombre des mouvements possibles
k=1;
X=0;%X=X+1 si le cavalier atteind (8,8)
A(i,j)=0.8;%coloration de la position initial en gris
A(i1,j1)=0.5;
f1=figure ; 
imshow(A);
S=zeros(1,2);
D=[i,j];D1=[i1,j1];
S=D-D1;
while ((k<M+1) && ((S(1)~=0) || (S(2)~=0)))
L=[[i-2,j+1];[i+2,j+1];[i-2,j-1];[i+2,j-1];[i+1,j-2];[i+1,j+2];[i-1,j+2];[i-1,j-2]];%Liste des mouvements possibles
L1=[[i1-2,j1+1];[i1+2,j1+1];[i1-2,j1-1];[i1+2,j1-1];[i1+1,j1-2];[i1+1,j1+2];[i1-1,j1+2];[i1-1,j1-2]];
x=randi(8);
y=randi(8);
A(i,j)=B(i,j);
i=L(x,1);
j=L(x,2);
while ((i<1)|| (i>8) || (j<1) || (j>8))
    x=randi(8);
    i=L(x,1);
    j=L(x,2);
endwhile
D=[i,j];
disp(D);
A(i,j)=0.8;
figure ;
imshow(A);
A(i1,j1)=B(i1,j1);
i1=L1(y,1);
j1=L1(y,2);
while ((i1<1)|| (i1>8) || (j1<1) || (j1>8))
    y=randi(8);
    i1=L1(y,1);
    j1=L1(y,2);
endwhile
D1=[i1,j1];
disp(D1);
S=D-D1;
A(i1,j1)=0.5;
k=k+1;
figure ;
imshow(A);
end
