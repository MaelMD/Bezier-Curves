function [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]=dbezier(XP1,YP1,d1,f1,XP2,YP2,d2,f2,iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]
%%   = dbezier(XP1,YP1,d1,f1,XP2,YP2,d2,f2,iter)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Recherche de l'intersection de deux courbes de Bézier
%%   
%%   Données : T  ensemble des valeurs du paramètre 
%%             XP1, YP1 coordonnées des points de contrôle
%%             XP2, YP2 coordonnées des points de contrôle
%%             d1,f1  paramètres des points de contrôle (début-fin)
%%             d2,f2  paramètres des points de contrôle (début-fin)
%%             iter   nombre d'appel de la procédure
%%             
%%
%%   Résultats :  
%%
%%             XQ1, YQ1 nouvelles coordonnées des points de contrôle
%%             XQ2, YQ2 nouvelles coordonnées des points de contrôle
%%             td1,tf1  nouveaux paramètres des points de contrôle  
%%             td2,tf2  nouveaux paramètres des points de contrôle  
%%             iter    iter + 1 
%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Introduction au calcul scientifique par la pratique %%%%%%%
%%%%%%%    I. Danaila, P. Joly, S. M. Kaber et M. Postel    %%%%%%%
%%%%%%%                 Dunod, 2005                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
   [test,xi,xa,yi,ya]=rbezier(XP1,YP1,XP2,YP2);
   XQ1=XP1;YQ1=YP1;XQ2=XP2;YQ2=YP2;
   td1=d1;tf1=f1;td2=d2;tf2=f2;
%%
%%  Non convergence en itérations ?
%%
%  compteur d'itérations
   iter=iter+1;
   itmax=20;
   if ( iter > itmax )
      fprintf('\n Arrêt de la récursivité : non convergence ');
      trectan(xi,xa,yi,ya,'b'); 
      return
   end
%%
%%  Convergence en convexité ?
%%
   h1=convexe(XP1,YP1);h2=convexe(XP2,YP2);h=max(h1,h2);
   seuilc=5.e-05;
   if ( h < seuilc ) 
      fprintf('\n Convergence en convexité h = %f ',h);
      fprintf('\n Itération %d ',iter);
      return
   end
%%
%%  Convergence en abscisse ?
%%
   seuil=1.e-04;
   if ( abs(xa-xi) < seuil )
      fprintf('\n Convergence en x');
      fprintf('\n Itération %d ',iter);
      return
   end
%%
%%  Convergence en ordonnée ?
%%
   if ( abs(ya-yi) < seuil ) 
      fprintf('\n Convergence en y');
      fprintf('\n Itération %d ',iter);
      return
   end
%%
%% Subdivision des courbes
%%
   char=int2str(iter);char=strcat('RI: ',char);
%  le paramètre t
   tm1=(d1+f1)*0.5;
   [XP1a,YP1a]=cast1(tm1,XP1,YP1);
   [XP1b,YP1b]=cast2(tm1,XP1,YP1);
   tm2=(d2+f2)*0.5;
   [XP2a,YP2a]=cast1(tm2,XP2,YP2);
   [XP2b,YP2b]=cast2(tm2,XP2,YP2); 
%% les tests d'intersection
   [test1,xmi1,xma1,ymi1,yma1]=rbezier(XP1a,YP1a,XP2a,YP2a);
   [test2,xmi2,xma2,ymi2,yma2]=rbezier(XP1b,YP1b,XP2a,YP2a);
   [test3,xmi3,xma3,ymi3,yma3]=rbezier(XP1a,YP1a,XP2b,YP2b);
   [test4,xmi4,xma4,ymi4,yma4]=rbezier(XP1b,YP1b,XP2b,YP2b);
   if (test1==2) 
      trectan(xmi1,xma1,ymi1,yma1,'k');char1=strcat(char,'-1');text(xma1*1.05,ymi1*1.05,char1);
%%      fprintf('\n Intersection 1 - 1');   
%%      fprintf('\n xmi xma ymi yma %8.5f %8.5f %8.5f %8.5f ',xmi1,xma1,ymi1,yma1);
      [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]=dbezier(XP1a,YP1a,d1,tm1,XP2a,YP2a,d2,tm2,iter);
   elseif (test2==2) 
      trectan(xmi2,xma2,ymi2,yma2,'k');char2=strcat(char,'-2');text(xma2*1.05,ymi2*1.05,char2)
%%      fprintf('\n Intersection 2 - 1');
%%      fprintf('\n xmi xma ymi yma %8.5f %8.5f %8.5f %8.5f ',xmi2,xma2,ymi2,yma2);
      [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]=dbezier(XP1b,YP1b,tm1,f1,XP2a,YP2a,d2,tm2,iter);
   elseif (test3==2) 
      trectan(xmi3,xma3,ymi3,yma3,'k');char3=strcat(char,'-3');text(xma3*1.05,ymi3*1.05,char3);
%%      fprintf('\n Intersection 1 - 2');
%%      fprintf('\n xmi xma ymi yma %8.5f %8.5f %8.5f %8.5f ',xmi3,xma3,ymi3,yma3);
      [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]=dbezier(XP1a,YP1a,d1,tm1,XP2b,YP2b,tm2,f2,iter);
   elseif (test4==2) 
      trectan(xmi4,xma4,ymi4,yma4,'k');char4=strcat(char,'-4');text(xma4*1.05,ymi4*1.05,char4);
%%      fprintf('\n Intersection 2 - 2');
%%      fprintf('\n xmi xma ymi yma %8.5f %8.5f %8.5f %8.5f ',xmi4,xma4,ymi4,yma4);
      [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]=dbezier(XP1b,YP1b,tm1,f1,XP2b,YP2b,tm2,f2,iter);
   end