%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 1 du projet CAO
%%   Construction d'une courbe de Bézier 
%%   avec tracé d'un polygone de contrôle non convexe
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Exemple d'un polygone de contrôle convexe
%%
clear all; close all;
% définition des points de contrôle 
np=5;
XP=zeros(np,1);YP=zeros(np,1);
XP=[ 0. , 3. , 2. , 1. , 3.5 ] ;
YP=[ 0. , 1.5 , 3. , 2.5 , 0. ] ;
% échantillonage de la courbe de Bézier
T=[0:0.05:1.];
[X,Y]=cbezier(T,XP,YP);
%
% représentation graphique  
%
% a) définition de la figure 
nf=1; figure(nf) ; hold on ;
xmin=min(XP)-0.5;xmax=max(XP)+0.5;
ymin=min(YP)-0.5;ymax=max(YP)+0.5;
axis([xmin,xmax,ymin,ymax]);
% b) tracé de la courbe de Bézier
color='r';pchar='P';pcolor='b';ptrait='--';
pbezier(X,Y,XP,YP,color,pchar,pcolor,ptrait)
title('Une courbe de Bézier avec son polygone de contrôle'); hold off ;