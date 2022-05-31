function [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]=dbezier(XP1,YP1,d1,f1,XP2,YP2,d2,f2,iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   function [XQ1,YQ1,td1,tf1,XQ2,YQ2,td2,tf2,iter]
%%   = dbezier(XP1,YP1,d1,f1,XP2,YP2,d2,f2,iter)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   Recherche de l'intersection de deux courbes de B�zier
%%   
%%   Donn�es : T  ensemble des valeurs du param�tre 
%%             XP1, YP1 coordonn�es des points de contr�le
%%             XP2, YP2 coordonn�es des points de contr�le
%%             d1,f1  param�tres des points de contr�le (d�but-fin)
%%             d2,f2  param�tres des points de contr�le (d�but-fin)
%%             iter   nombre d'appel de la proc�dure
%%             
%%
%%   R�sultats :  
%%
%%             XQ1, YQ1 nouvelles coordonn�es des points de contr�le
%%             XQ2, YQ2 nouvelles coordonn�es des points de contr�le
%%             td1,tf1  nouveaux param�tres des points de contr�le  
%%             td2,tf2  nouveaux param�tres des points de contr�le  
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
%%  Non convergence en it�rations ?
%%
%  compteur d'it�rations
   iter=iter+1;
   itmax=20;
   if ( iter > itmax )
      fprintf('\n Arr�t de la r�cursivit� : non convergence ');
      trectan(xi,xa,yi,ya,'b'); 
      return
   end
%%
%%  Convergence en convexit� ?
%%
   h1=convexe(XP1,YP1);h2=convexe(XP2,YP2);h=max(h1,h2);
   seuilc=5.e-05;
   if ( h < seuilc ) 
      fprintf('\n Convergence en convexit� h = %f ',h);
      fprintf('\n It�ration %d ',iter);
      return
   end
%%
%%  Convergence en abscisse ?
%%
   seuil=1.e-04;
   if ( abs(xa-xi) < seuil )
      fprintf('\n Convergence en x');
      fprintf('\n It�ration %d ',iter);
      return
   end
%%
%%  Convergence en ordonn�e ?
%%
   if ( abs(ya-yi) < seuil ) 
      fprintf('\n Convergence en y');
      fprintf('\n It�ration %d ',iter);
      return
   end
%%
%% Subdivision des courbes
%%
   char=int2str(iter);char=strcat('RI: ',char);
%  le param�tre t
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