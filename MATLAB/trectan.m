function trectan(xmi,xma,ymi,yma,color) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function trectan(xmi,xma,ymi,yma,color) 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Tracé d'un rectangle 
%%   
%%   Données  : xmin,xmax,ymin,ymax coordonnées des sommets
%%
%%   Résultats : tracé du rectangle 
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
xx(1)=xmi;xx(2)=xma;
xx(3)=xx(2);xx(4)=xx(1);xx(5)=xx(1);
yy(1)=ymi;yy(2)=yy(1);
yy(3)=yma;yy(4)=yy(3);yy(5)=yy(1);
plot(xx,yy,color)
