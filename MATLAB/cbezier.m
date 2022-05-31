function [X,Y]=cbezier(T,XP,YP);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [X,Y]=cbezier(T,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Construction d'un �chantillonage de points d'une courbe
%%   de B�zier par l'algorithme de Casteljau.
%%   
%%   Donn�es : XP, YP coordonn�es des points de contr�le
%%             T  ensemble des valeurs du param�tre 
%%
%%   R�sultats : X, Y coordonn�es des points  P(T)
%%
n=size(T,2); %% n = nombre de points de l'�chantillonage
X=zeros(n,1);Y=zeros(n,1);
for k=1:n
t=T(k);
[x,y]=casteljau(t,XP,YP);
X(k)=x;Y(k)=y;
end
