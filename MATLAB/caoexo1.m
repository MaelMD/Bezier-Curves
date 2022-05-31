%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 1 du projet CAO
%%   Construction d'une courbe de Bézier
%%
%%   Exemple d'un polygone de contrôle convexe
%%
clear all; close all;
% définition des points de contrôle 
np=5;
XP=zeros(np,1);YP=zeros(np,1);
XP=[ 0. , 1. , 2. , 3. , 3.5   ] ;
YP=[ 0. , 2.5 , 3. , 1.5 , 0.   ] ;
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
tbezier(X,Y,color,XP,YP,pchar,pcolor,ptrait)
title('Une courbe de Bézier'); hold off ;