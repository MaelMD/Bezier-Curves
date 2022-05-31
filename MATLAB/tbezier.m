function tbezier(X,Y,color,XP,YP,pchar,pcolor,ptrait);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  function tbezier(X,Y,color,XP,YP,pchar,pcolor,ptrait)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  Tracé d'une courbe de Bézier et de ses points de contrôle
%%
%%   Données  : X, Y coordonnées des points de l'échantillonage
%%              color couleur de la courbe tracée
%%              XP, YP coordonnées des points de contrôle
%%              pchar caractère associé aux points de contrôle
%%              pcolor couleur de la courbe de contrôle
%%              ptrait type de trait de la courbe de contrôle
%%
%%   Résultats : Tracé graphique de la courbe et des points
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
ligne=strcat(pcolor,ptrait);
plot(X,Y,color,XP,YP,ligne)
np=size(XP,2);
for k=1:np
kk=k-1;
char=int2str(kk);
P=strcat(pchar,char);
epsx=0.1;epsy=0.2;
if (k==1) epsx=0.; epsy=-0.2; end
if (k==np) epsx=0.2; epsy=0.; end
text(XP(k)+epsx,YP(k)+epsy,P);
end
