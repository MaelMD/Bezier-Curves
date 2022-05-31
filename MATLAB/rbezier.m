function [inter,xmi,xma,ymi,yma]=rbezier(XP1,YP1,XP2,YP2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 2 du projet CAO
%%   Intersection de deux courbes de Bézier :
%%   Calcul des enveloppes rectangulaires
%%   et test de leur intersection
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
[xmin1,xmax1,ymin1,ymax1]=drectan(XP1,YP1);
[xmin2,xmax2,ymin2,ymax2]=drectan(XP2,YP2);
xmi=max(xmin1,xmin2);xma=min(xmax1,xmax2);
ymi=max(ymin1,ymin2);yma=min(ymax1,ymax2);
inter=0;seuil=1.e-06;
if ( xma-xmi > seuil )
   inter = inter + 1 ;
end
if ( yma-ymi > seuil )
   inter = inter + 1 ;
end
%% fprintf('\n Intersection : %d %f %f %f %f ',inter,xmi,xma,ymi,yma);
