function pbezier(X,Y,XP,YP,color,pchar,pcolor,ptrait);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  function pbezier(X,Y,XP,YP,color,pchar,pcolor,ptrait)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  Tracé d'une courbe de Bézier et de son polygone de contrôle
%%
%%   Données : X, Y coordonnées des points de l'échantillonage
%%             XP, YP coordonnées des points de contrôle
%%             color couleur de la courbe tracée
%%             pchar caractère associé aux points de contrôle
%%             pcolor couleur de la courbe de contrôle
%%             ptrait type de trait de la courbe de contrôle
%%
%%   Résultats : Tracé graphique de la courbe et du polygone
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
ligne=strcat(pcolor,ptrait);
XP0=[ XP , XP(1) ] ;
YP0=[ YP , YP(1) ] ;
plot(X,Y,color,XP0,YP0,ligne)
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
