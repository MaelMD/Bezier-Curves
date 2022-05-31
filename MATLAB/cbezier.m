function [X,Y]=cbezier(T,XP,YP);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [X,Y]=cbezier(T,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Construction d'un échantillonage de points d'une courbe
%%   de Bézier par l'algorithme de Casteljau.
%%   
%%   Données : XP, YP coordonnées des points de contrôle
%%             T  ensemble des valeurs du paramètre 
%%
%%   Résultats : X, Y coordonnées des points  P(T)
%%
n=size(T,2); %% n = nombre de points de l'échantillonage
X=zeros(n,1);Y=zeros(n,1);
for k=1:n
t=T(k);
[x,y]=casteljau(t,XP,YP);
X(k)=x;Y(k)=y;
end
