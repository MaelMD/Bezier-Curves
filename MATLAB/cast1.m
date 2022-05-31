function [XPP,YPP]=cast1(t,XP,YP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [XPP,YPP]=cast1(t,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Enveloppe convexe d'une courbe de Bézier
%%   Construction des points de contrôle 
%%   Première partie t dans [0.,0.5]
%%   
%%   Données : t  valeur du paramètre 
%%             XP, YP coordonnées des points de contrôle
%%
%%   Résultats : XPP, YPP coordonnées des points de contrôle 
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  
m=size(XP,2)-1;
XPP=XP;YPP=YP;
xx=XP;yy=YP;
XPP(1)=xx(1);YPP(1)=yy(1);
for kk=1:m
xxx=xx;
yyy=yy;
for k=kk:m
xx(k+1)=(1-t)*xxx(k)+t*xxx(k+1);
yy(k+1)=(1-t)*yyy(k)+t*yyy(k+1);
end
XPP(kk+1)=xx(kk+1);YPP(kk+1)=yy(kk+1);
end
