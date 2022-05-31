%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 3 du projet CAO
%%   Construction d'une surface de B�zier
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Exemple d'un polygone de contr�le convexe
%%
clear all; close all;
np1=4;np2=5;
% d�finition des points de contr�le 
XP=zeros(np1,np2);YP=zeros(np1,np2);ZP=zeros(np1,np2);
XP=[ 0. , 0. , 0. , 0. , 0. ;
     1. , 1. , 1. , 1. , 1. ;
     2. , 2. , 2. , 2. , 2. ;
     3. , 3. , 3. , 3. , 3. ] ;
YP=[ 0. , 1. , 2. , 3. , 4. ;
     0. , 1. , 2. , 3. , 4. ;
     0. , 1. , 2. , 3. , 4. ;
     0. , 1. , 2. , 3. , 4. ] ;
%%  plusieurs choix de ZP
%%  Une surface plane
ZP=[ 0. , 0. , 0. , 0. , 0. ;
     1. , 1. , 1. , 1. , 1. ;
     2. , 2. , 2. , 2. , 2. ;
     3. , 3. , 3. , 3. , 3. ] ;
%%  Une surface al�atoire
ZP=rand(np1,np2);
%%  Une surface cylindrique
for k1=1:np1
for k2=1:np2
d=(XP(k1,k2)-1.)*(XP(k1,k2)-1.);
d=d+(YP(k1,k2)-0.5)*(YP(k1,k2)-0.5);
ZP(k1,k2)=sqrt(d);
end
end
% �chantillonage de la surface de B�zier
%
T=[0:0.05:1.];
[X,Y,Z,TRI]=sbezier(T,XP,YP,ZP);
%%
%% le trac� de la surface
%%
nf=1; figure(nf) ; hold on ;
xmin=min(min(XP));xmax=max(max(XP));
ymin=min(min(YP));ymax=max(max(YP));
zmin=min(min(ZP));zmax=max(max(ZP));
dx=0.1;dy=0.1;dz=0.1;
axis([xmin-dx,xmax+dx,ymin-dy,ymax+dy,zmin-dz,zmax+dz]);
ubezier(TRI,X,Y,Z,XP,YP,ZP,'P','k')
title('Une surface de B�zier'); hold off ;