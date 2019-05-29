NACA='2901';
Mmain=str2double(NACA(1));
Pmain=str2double(NACA(2));
Tmain=str2double(NACA(3:4));
GridPts=300;
x = linspace(0,1,GridPts)';
m=Mmain/100;
p=Pmain/10;
t=Tmain/100;

a0=2.969;
a1=-1.260;
a2=-3.516;
a3=2.843;
a4=-1.015;

Yt=ones(GridPts,1);

 for i=1:1:GridPts
    term1=a0*sqrt(x(i));
    term2=a1*x(i);
    term3=a2*x(i)^2;
    term4=a3*x(i)^3;
    term5=a4*x(i)^4;
    
    Yt(i)=5*t*(term1+term2+term3+term4+term5);
    
 end

 Yc=ones(GridPts,1);
 dYc_dx= ones(GridPts,1);
 theta=  ones(GridPts,1);
 for i=1:1:GridPts
 if (x(i)>=0 && x(i)<p)
     Yc(i)=((m)/(p)^2)*(2*p*x(i)-x(i)^2);
     dYc_dx(i)= ((2*m)/((p)^2))*(p-x(i));
     
 elseif (x(i)>=p && x(i)<=1)
     Yc(i)=((m)/(1-p)^2)*(1-2*p+2*p*x(i)-x(i)^2);
     dYc_dx(i)= ((2*m)/((1-p)^2))*(p-x(i));
 end
 theta(i)=atan(dYc_dx(i));
 end
 
 xu=ones(GridPts,1);
 yu=ones(GridPts,1);
 xl=ones(GridPts,1);
 yl=ones(GridPts,1);
 for i=1:1:GridPts
         xu(i)=x(i)-0.5*Yt(i)*sin(theta(i));
        yu(i)=Yc(i)+0.5*Yt(i)*cos(theta(i));
     end
      for i=1:1:GridPts
          xl(i)=x(i)+0.5*Yt(i)*sin(theta(i));
         yl(i)=Yc(i)-0.5*Yt(i)*cos(theta(i));
      end
      
      fl=figure(1);
      hold on;
      grid on;
 axis equal;
      plot(xu,yu,'r-');
      plot(xl,yl,'k-');
      
      
   
     

