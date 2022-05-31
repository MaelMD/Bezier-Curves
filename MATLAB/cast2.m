function [XPP,YPP]=cast2(t,XP,YP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [XPP,YPP]=cast2(t,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Enveloppe convexe d'une courbe de Bézier
%%   Construction des points de contrôle 
%%   Deuxième partie t dans [0.5,1.]
%%   
%%   Données : t  valeur du paramètre 
%%             XP, YP coordonnées des points de contrôle
%%
%%   Résultats : XPP,YPP coordonnées des points de contrôle 
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  
m=size(XP,2)-1;
for k=1:m+1
   xx(m+2-k)=XP(k);
   yy(m+2-k)=YP(k);
end
for kk=1:m
xxx=xx;
yyy=yy;
XPP(m+2-kk)=xx(kk);YPP(m+2-kk)=yy(kk);
for k=kk:m
xx(k+1)=t*xxx(k)+(1.-t)*xxx(k+1);
yy(k+1)=t*yyy(k)+(1.-t)*yyy(k+1);
end
end
XPP(1)=xx(m+1);YPP(1)=yy(m+1);

