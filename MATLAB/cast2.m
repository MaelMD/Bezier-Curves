function [XPP,YPP]=cast2(t,XP,YP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [XPP,YPP]=cast2(t,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Enveloppe convexe d'une courbe de B�zier
%%   Construction des points de contr�le 
%%   Deuxi�me partie t dans [0.5,1.]
%%   
%%   Donn�es : t  valeur du param�tre 
%%             XP, YP coordonn�es des points de contr�le
%%
%%   R�sultats : XPP,YPP coordonn�es des points de contr�le 
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

