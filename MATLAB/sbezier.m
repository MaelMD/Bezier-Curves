function [X,Y,Z,TRI]=sbezier(T,XP,YP,ZP);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [X,YZ,TRI]=sbezier(T,XP,YP,ZP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Construction d'un échantillonage de points d'une surface
%%   de Bézier par l'algorithme de Coox.
%%   
%%   Données : XP, YP, ZP coordonnées des points de contrôle
%%             T  ensemble des valeurs du paramètre 
%%
%%   Résultats : X, Y, Z coordonnées des points  P(T)
%%              TRI liste des facettes triangulaires de la surface
%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
n=size(T,2);n1=n-1;n2=n*n;
X=zeros(n2,1);Y=zeros(n2,1);Z=zeros(n2,1);
for k1=1:n
for k2=1:n
t1=T(k1);t2=T(k2);
[x,y,z]=coox(t1,t2,XP,YP,ZP);
k=k1+(k2-1)*n;
X(k)=x;Y(k)=y;Z(k)=z;
end
end
%%  les triangles (facettes de la surface)
m=n1*n1*2;
TRI=zeros(m,3);
for k1=1:n1
for k2=1:n1
k=k1+(k2-1)*n1;
kk=k1+(k2-1)*n;
%% premier triangle
TRI(2*k-1,1)=kk;
TRI(2*k-1,2)=kk+1;
TRI(2*k-1,3)=kk+1+n;
%% second  triangle
TRI(2*k,1)=kk;
TRI(2*k,2)=kk+n;
TRI(2*k,3)=kk+n+1;
end
end