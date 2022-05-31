%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Solution Matlab de l'exercice 3 du projet CAO
%%   Exemple de raccord C0 de deux surfaces de Bézier
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear all; close all;
%%  la surface 1
np1=4;np2=5;
XP1=zeros(np1,np2);
YP1=zeros(np1,np2);
ZP1=zeros(np1,np2);
XP1=[ 0. , 0. , 0. , 0. , 0. ;
      .5 , .5 , .5 , .5 , .5 ;
      1. , 1. , 1. , 1. , 1. ;
      2. , 2. , 2. , 2. , 2. ] ;
YP1=[ 0. , 1. , 2. , 3. , 4. ;
      0. , 1. , 2. , 3. , 4. ;
      0. , 1. , 2. , 3. , 4. ;
      0. , 1. , 2. , 3. , 4. ] ;
%%  plusieurs choix de ZP
%%  Une surface plane
plan=0;
if (plan==1)
ZP1=[ 0. , 0. , 0. , 0. , 0. ;
      1. , 1. , 1. , 1. , 1. ;
      2. , 2. , 2. , 2. , 2. ;
      3. , 3. , 3. , 3. , 3. ] ;
end
%%  Une surface aléatoire
alea=0;
if (alea==1)
ZP1=rand(np1,np2);
end
%%  Une surface cylindrique
cyl=1;
if (cyl==1)
 xc1=0.;yc1=4.;zc1=1.;r1=4.;
 for k1=1:np1
 r1=r1-(k1-1)*0.2;
 for k2=1:np2
   ddx=(XP1(k1,k2)-xc1)*(XP1(k1,k2)-xc1);
   ddy=(YP1(k1,k2)-yc1)*(YP1(k1,k2)-yc1);
   ZP1(k1,k2)=zc1+sqrt(r1*r1-ddy);
  end
  end
end
%% la surface 2
np3=4;np4=5;
XP2=zeros(np3,np4);
YP2=zeros(np3,np4);
ZP2=zeros(np3,np4);
XP2=[ 2. , 2. , 2. , 2. , 2. ;
      3.5 , 3.5 , 3.5 , 3.5 , 3.5 ;
      4. , 4. , 4. , 4. , 4. ;
      5. , 5. , 5. , 5. , 5. ] ;
YP2=[ 0. , 1. , 2. , 3. , 4. ;
      0. , 1. , 2. , 3. , 4. ;
      0. , 1. , 2. , 3. , 4. ;
      0. , 1. , 2. , 3. , 4. ] ;
%%  plusieurs choix de ZP
%%  Une surface plane
if (plan==1)
ZP2=[ 0. , 0. , 0. , 0. , 0. ;
      1. , 1. , 1. , 1. , 1. ;
      2. , 2. , 2. , 2. , 2. ;
      3. , 3. , 3. , 3. , 3. ] ;
end
%%  Une surface aléatoire
if (alea==1)
ZP2=rand(np3,np4);
end
%%  Une surface cylindrique
%%  le raccord C0 est imposé 
%%  en prenant le même centre 
%%  du cercle et le même rayon
if (cyl==1)
 xc2=0.;yc2=4.;zc2=1.;r2=r1;
 for k1=1:np3
 r2=r2+(k1-1)*0.4;
 for k2=1:np4
   ddx=(XP2(k1,k2)-xc2)*(XP2(k1,k2)-xc2);
   ddy=(YP2(k1,k2)-yc2)*(YP2(k1,k2)-yc2);
   ZP2(k1,k2)=zc2+sqrt(r2*r2-ddy);
 end
 end
end
%%
%% les surfaces de Bézier
%%
T1=[0:0.05:1.];T2=[0:0.1:1.];
[X1,Y1,Z1,TRI1]=sbezier(T1,XP1,YP1,ZP1);
[X2,Y2,Z2,TRI2]=sbezier(T2,XP2,YP2,ZP2);
 %%
%%  Le tracé
%%
XP=[XP1,XP2];YP=[YP1,YP2];ZP=[ZP1,ZP2];
nf=1;
figure(nf)
hold on
xmin=min(min(XP));xmax=max(max(XP));
ymin=min(min(YP));ymax=max(max(YP));
zmin=min(min(ZP));zmax=max(max(ZP));
dx=0.1;dy=0.1;dz=0.1;
axis([xmin-dx,xmax+dx,ymin-dy,ymax+dy,zmin-dz,zmax+dz]);
% tracé de la surface 1
ubezier(TRI1,X1,Y1,Z1,XP1,YP1,ZP1,'P','k')
ubezier(TRI2,X2,Y2,Z2,XP2,YP2,ZP2,'Q','k')
 title('Raccord de deux surfaces de Bézier');
hold off
