function ubezier(TRI,X,Y,Z,XP,YP,ZP,pchar,color)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function  ubezier(TRI,X,Y,Z,XP,YP,ZP,pchar,color)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Tracé d'une surface de Bézier et de ses points de contrôle
%%   
%%   Données : TRI liste des facettes triangulaires de la surface
%%   Données : X, Y, Z coordonnées des points de l'échantillonage
%%   Données : XP, YP, ZP coordonnées des points de contrôle
%%             T  ensemble des valeurs du paramètre 
%%              pchar caractère associé aux points de contrôle
%%              pcolor couleur de la courbe de contrôle
%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
tcolor=strcat(color,'--');
% tracé de la surface
trisurf(TRI,X,Y,Z)
% tracé des points
texte=1;
if (texte==1)
np1=size(XP,1);np2=size(XP,2);
%%
for k1=1:np1
kk1=k1-1;
char1=int2str(kk1);
PP=strcat(pchar,char1);
for k2=1:np2
kk2=k2-1;
char2=int2str(kk2);
P=strcat(PP,char2);
epsx=0.05;epsy=0.05;;epsz=0.05;
text(XP(k1,k2)+epsx,YP(k1,k2)+epsy,ZP(k1,k2)+epsz,P);
end
end
%%
end