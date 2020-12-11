a=imread('orangutan.tif');

b=a;
figure(1);
imshow(a);
title('»Ò¶ÈÍ¼Ïñ');
[m,n]=size(b);
for i=1:m
for j=1:n
     if(b(i,j)>0)&&(b(i,j)<127)
        b(i,j)=0;   
     else
        b(i,j)=255; 
     end
end
end
figure(2)
imshow(b);
title('2x2Í¼Ïñ');
b1=a;
[m,n]=size(b1);
for i=1:m
for j=1:n
     if(b1(i,j)>0)&&(b1(i,j)<32)
        b1(i,j)=0;  
     end
     if(b1(i,j)>31)&&(b1(i,j)<64)  
         b1(i,j)=32; 
     end
     if(b1(i,j)>63)&&(b1(i,j)<96)  
         b1(i,j)=64; 
     end
     if(b1(i,j)>95)&&(b1(i,j)<128)  
         b1(i,j)=96; 
     end
     if(b1(i,j)>127)&&(b1(i,j)<160)  
         b1(i,j)=128; 
     end
     if(b1(i,j)>159)&&(b1(i,j)<192)  
         b1(i,j)=160; 
     end
     if(b1(i,j)>191)&&(b1(i,j)<224) 
         b1(i,j)=192; 
     end	
     if(b1(i,j)>223) 
         b1(i,j)=255; 
     end 
end
end
figure(3)
imshow(b1);
title('8x8Í¼Ïñ');


