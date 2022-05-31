%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 1 du projet CAO
%%   Construction d'une courbe de B�zier 
%%   avec trac� d'un polygone de contr�le non convexe
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
% d�finition des points de contr�le 
np=5;
XP=zeros(np,1);YP=zeros(np,1);
XP=[ 0. , 3. , 2. , 1. , 3.5 ] ;
YP=[ 0. , 1.5 , 3. , 2.5 , 0. ] ;
% �chantillonage de la courbe de B�zier
T=[0:0.05:1.];
[X,Y]=cbezier(T,XP,YP);
%
% repr�sentation graphique  
%
% a) d�finition de la figure 
nf=1; figure(nf) ; hold on ;
xmin=min(XP)-0.5;xmax=max(XP)+0.5;
ymin=min(YP)-0.5;ymax=max(YP)+0.5;
axis([xmin,xmax,ymin,ymax]);
% b) trac� de la courbe de B�zier
color='r';pchar='P';pcolor='b';ptrait='--';
pbezier(X,Y,XP,YP,color,pchar,pcolor,ptrait)
title('Une courbe de B�zier avec son polygone de contr�le'); hold off ;