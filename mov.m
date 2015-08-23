function [] = mov(cbx,cby,cbx2,cby2,cox,coy,m,a,vid,n)
m4=(coy-cby2)/(cox-cbx2);
m3=(m-m4)/(1+(m*m4));
if(atand(m3)<0)
while(~((atand(m3)<=5)&&(atand(m3)>= -5)))
   a.analogWrite(5,0);
   a.analogWrite(6,95);
   a.analogWrite(10,95);
   a.analogWrite(9,0);
   trigger(vid);  
   im=getdata(vid,1);
   im=im2double(im);
   [im1,cbx,cby,cbx3,cby3,m]=bot(im);  
   m3=(m-m4)/(1+(m*m4));
   atand(m3);
   %flushdata(vid);
end
else
while(~((atand(m3)<=5)&&(atand(m3)>= -5)))
   a.analogWrite(5,95);
   a.analogWrite(6,0);
   a.analogWrite(10,0);
   a.analogWrite(9,95);
   trigger(vid);  
   im=getdata(vid,1);
   im=im2double(im);
   [im1,cbx,cby,cbx3,cby3,m]=bot(im);  
   m3=(m-m4)/(1+(m*m4));
   atand(m3);
   %flushdata(vid);
end
end

m2=(coy-cby)/(cox-cbx);
while(a.digitalRead(2)~=1) 
   trigger(vid);
   im=getdata(vid,1);  
   im=im2double(im);
   [im1,cbx1,cby1,cbx3,cby3,m]=bot(im);
    while(((cby1-cby-1)- (m2*(cbx1-cbx-1))<=10)&&((cby1-cby-1)- (m2*(cbx1-cbx-1))>= -10))
        if(a.digitalRead(2)==1)
    break
        end
     a.analogWrite(5,100); %m1,m2 left   m3,m4  right%
     a.analogWrite(6,0);
     a.analogWrite(10,100);
     a.analogWrite(9,0);  
     trigger(vid);
     im=getdata(vid,1);
     im=im2double(im);
     [im1,cbx1,cby1,cbx3,cby3,m]=bot(im);
     %flushdata(vid);
    end
     if(a.digitalRead(2)==1)
    break
     end
    while((cby1-cby-1)- (m2*(cbx1-cbx-1))< -10)
        if(a.digitalRead(2)==1)
    break
        end
        (cby1-cby-1)- (m2*(cbx1-cbx-1))
       
         a.analogWrite(5,105); %10,11 left   6,5  right%
         a.analogWrite(6,0);
         a.analogWrite(10,0);
         a.analogWrite(9,105);
         pause(0.2)
            a.analogWrite(5,0);
            a.analogWrite(6,0);
            a.analogWrite(10,0);
            a.analogWrite(9,0);
         trigger(vid);
         im=getdata(vid,1);
         im=im2double(im);
         [im1,cbx1,cby1,cbx3,cby3,m]=bot(im);  
         %flushdata(vid);
    end
     if(a.digitalRead(2)==1)
      break
     end
    while((cby1-cby-1)- (m2*(cbx1-cbx-1))>10)
          if(a.digitalRead(2)==1)
              break;
          end
(cby1-cby-1)- (m2*(cbx1-cbx-1))
a.analogWrite(5,0); %m1,m2 left   m3,m4  right%
a.analogWrite(6,105);
a.analogWrite(10,105);
a.analogWrite(9,0);
pause(0.2);
    a.analogWrite(6,0);
    a.analogWrite(5,0);
    a.analogWrite(10,0);
    a.analogWrite(9,0);
trigger(vid);
im=getdata(vid,1);
im=im2double(im);
[im1,cbx1,cby1,cbx3,cby3,m]=bot(im); 
%flushdata(vid); 
    end
 if(a.digitalRead(2)==1)
    break;
 end    
end
   while(a.digitalRead(2)==1)
    a.analogWrite(5,0);
    a.analogWrite(6,100);
    a.analogWrite(10,0);
    a.analogWrite(9,100);
   pause(1); 
   end
   
end
   

