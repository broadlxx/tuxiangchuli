F=imread('iris.tif');
[row,col]=size(F); 
max=double(F(1,1))+1; 
for i=1:row 
    for j=1:col
        k=double(F(i,j))+1;
if max<k
max=k;
end
    end
end

a=30; 
b=40; 
if b>max 
    disp('范围不能大于最大值');
end
c=100;
d=180;
if d>256 %判断d是否超过256
    disp('范围不能超过255');
end
G=zeros(row,col); 
for i=1:row 
    for j=1:col
      k=double(F(i,j))+1;
        if k<a
    G(i,j)=(c/a)*F(i,j);
        elseif k<b
    G(i,j)=((d-c)/(b-a))*(F(i,j)-a)+c;
        else
    G(i,j)=((255-d)/(max-b))*(F(i,j)-b)+d;
        end
    end
end
out=uint8(round(G-1)); 
figure,imshow(F); 
title('源图像');
figure,imshow(out); 
title('线性变换后');
figure,imhist(F); 
title('源图像的直方图');
figure,imhist(out); 
title('线性变换后的直方图');


