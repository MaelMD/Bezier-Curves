function [x,y]=casteljau(t,XP,YP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [x,y]=casteljau(t,XP,YP)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Construction du point P(t) d'une courbe de B�zier pour 
%%   la valeur t du param�tre, par l'algorithme de Casteljau.
%%   
%%   Donn�es : XP, YP coordonn�es des points de contr�le
%%             t  valeur du param�tre 
%%
%%   R�sultats : x,y coordonn�es du point P(t)
%%
m=size(XP,2)-1;    %% m = nombre de points de contr�le
xx=XP;yy=YP;
for kk=1:m
xxx=xx;
yyy=yy;
for k=kk:m
xx(k+1)=(1-t)*xxx(k)+t*xxx(k+1);
yy(k+1)=(1-t)*yyy(k)+t*yyy(k+1);
end
end
x=xx(m+1);y=yy(m+1);