clc;
clear all;
A=zeros(8,8);
A(1:2:8, 1:2:8)=1; 
A(2:2:8, 2:2:8)=1;
M=1000; %nombre demouvement max faite par le cavalier
X=0;   %compteur sur le nombre de scinario ou le cavalier atteint la case (8,8)
K=0;   %valeur moyenne des mouvements possibles pour atteindre la case (8,8)
N=100; %nombre de scinario
B=[1:M];
B1=zeros(1,M);
for b=1:M
X=0;
K=0;
for e=1:N
i=1;
j=1;
k=1;
A(i,j)=0.5;
while ((k<b+1) && ((i~=8) || (j~=8)))
L=[[i-2,j+1];[i+2,j+1];[i-2,j-1];[i+2,j-1];[i+1,j-2];[i+1,j+2];[i-1,j+2];[i-1,j-2]];
x=randi(8);
if i<7
A(i,j)=A(i+2,j);
else
A(i,j)=A(i-2,j);
end
i=L(x,1);
j=L(x,2);
while ((i<1)|| (i>8) || (j<1) || (j>8) )
    x=randi(8);
    i=L(x,1);
    j=L(x,2);
endwhile
A(i,j)=0.5;
k=k+1;
end
if i==8 && j==8
  X=X+1;
  K=K+(k/N);
endif
end
B1(b)=X;
end
figure;
plot(B,B1);
