function [x,y,z]=cast3d(t,XP,YP,ZP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [x,y,z]=cast3d(t,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Construction du point P(t) d'une courbe de B�zier pour 
%%   la valeur t du param�tre, par l'algorithme de Casteljau.
%%   
%%   Donn�es : XP, YP, ZP coordonn�es des points de contr�le
%%             t  valeur du param�tre 
%%
%%   R�sultats : x,y,z coordonn�es du point P(t) dans R^3
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
m=size(XP,1)-1;
xx=XP;yy=YP;zz=ZP;
for kk=1:m
xxx=xx;yyy=yy;zzz=zz;
for k=kk:m
xx(k+1)=(1-t)*xxx(k)+t*xxx(k+1);
yy(k+1)=(1-t)*yyy(k)+t*yyy(k+1);
zz(k+1)=(1-t)*zzz(k)+t*zzz(k+1);
end
end
x=xx(m+1);y=yy(m+1);z=zz(m+1);