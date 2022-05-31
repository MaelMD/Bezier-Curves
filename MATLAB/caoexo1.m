%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 1 du projet CAO
%%   Construction d'une courbe de B�zier
%%
%%   Exemple d'un polygone de contr�le convexe
%%
clear all; close all;
% d�finition des points de contr�le 
np=5;
XP=zeros(np,1);YP=zeros(np,1);
XP=[ 0. , 1. , 2. , 3. , 3.5   ] ;
YP=[ 0. , 2.5 , 3. , 1.5 , 0.   ] ;
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
tbezier(X,Y,color,XP,YP,pchar,pcolor,ptrait)
title('Une courbe de B�zier'); hold off ;