function [x,y,z]=coox(t1,t2,XP,YP,ZP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 2 du projet CAO
%%   Construction d'un point d'une surface de Bézier 
%%   selon l'algorithme De Boor -- Coox
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    
np1=size(XP,1);np2=size(XP,2);
xx1=zeros(np1,1);yy1=zeros(np1,1);zz1=zeros(np1,1);
%%  construction des points P_q1
for k1=1:np1
%% initialisation : points P(k1,1:np2)
xx2=zeros(np2,1);yy2=zeros(np2,1);zz2=zeros(np2,1);
for k2=1:np2
xx2(k2)=XP(k1,k2);
yy2(k2)=YP(k1,k2);
zz2(k2)=ZP(k1,k2);
end
[x,y,z]=cast3d(t2,xx2,yy2,zz2);
xx1(k1)=x;
yy1(k1)=y;
zz1(k1)=z;
end
[x,y,z]=cast3d(t1,xx1,yy1,zz1); 