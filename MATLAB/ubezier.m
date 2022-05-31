function ubezier(TRI,X,Y,Z,XP,YP,ZP,pchar,color)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function  ubezier(TRI,X,Y,Z,XP,YP,ZP,pchar,color)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Trac� d'une surface de B�zier et de ses points de contr�le
%%   
%%   Donn�es : TRI liste des facettes triangulaires de la surface
%%   Donn�es : X, Y, Z coordonn�es des points de l'�chantillonage
%%   Donn�es : XP, YP, ZP coordonn�es des points de contr�le
%%             T  ensemble des valeurs du param�tre 
%%              pchar caract�re associ� aux points de contr�le
%%              pcolor couleur de la courbe de contr�le
%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
tcolor=strcat(color,'--');
% trac� de la surface
trisurf(TRI,X,Y,Z)
% trac� des points
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