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
    disp('��Χ���ܴ������ֵ');
end
c=100;
d=180;
if d>256 %�ж�d�Ƿ񳬹�256
    disp('��Χ���ܳ���255');
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
title('Դͼ��');
figure,imshow(out); 
title('���Ա任��');
figure,imhist(F); 
title('Դͼ���ֱ��ͼ');
figure,imhist(out); 
title('���Ա任���ֱ��ͼ');


