function [xmin,xmax,ymin,ymax]=drectan(XP,YP) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [xmin,xmax,ymin,ymax]=drectan(XP,YP) 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Calcul de l'enveloppe rectangulaire des points de contr�le
%%
%%   
%%   Donn�es  : XP, YP coordonn�es des points de contr�le
%%
%%   R�sultats : xmin,xmax,ymin,ymax coordonn�es des sommets
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
xmin=min(XP);xmax=max(XP);
ymin=min(YP);ymax=max(YP);
 