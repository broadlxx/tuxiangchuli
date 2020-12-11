clc;clear all;
img=imread('lean512.jpg');
subplot(2,3,1);
imshow(img);
title('原图像');
imggauss=imnoise(img,'gaussian',0,0.002);
subplot(2,3,2);
imshow(imggauss);
title('添加高斯噪声图像');

saltimg=imnoise(img,'salt & pepper',0.04);
subplot(2,3,3);
imshow(saltimg);
title('添加jiaoyan噪声图像');


[m,n]=size(imggauss);
I1=im2double(imggauss);
T=16;

for h1=1:m
    Y(1,h1)=I1(1,h1);
    Y(n,h1)=I1(n,h1);
end
for w1=1:n
    Y(w1,1)=I1(w1,1);
    Y(w1,m)=I1(w1,m);
end
for i=2:n-1
    for j=2:m-1
        ave1=(I1(i-1,j-1)+I1(i-1,j)+I1(i-1,j+1)+I1(i,j-1)+I1(i,j+1)+I1(i+1,j-1)+I1(i+1,j)+I1(i+1,j+1))/8;
        if abs(ave1-I1(i,j))>T
            Y(i,j)=ave1;
        else
            Y(i,j)=I1(i,j);
        end
    end
end
pic1=im2uint8(Y);
subplot(2,3,4);
imshow(pic1);
title('超限像素平滑法');
            
        


[x,y] = size(imggauss);
I=im2double(imggauss);
for h=1:x
    X(1,h)=I(1,h);
    X(y,h)=I(y,h);
end
for w=1:y
    X(w,1)=I(w,1);
    X(w,x)=I(w,x);
end
for i=2:y-1
    for j=2:x-1
        I1 = I(i-1,j-1)-I(i,j);
        I2 = I(i-1,j)-I(i,j);
        I3 = I(i-1,j+1)-I(i,j);
        I4 = I(i,j-1)-I(i,j);
        I6 = I(i,j+1)-I(i,j);
        I7 = I(i+1,j-1)-I(i,j);
        I8 = I(i+1,j)-I(i,j);
        I9 = I(i+1,j+1)-I(i,j);
        shuzu=[I1,I2,I3,I4,I6,I7,I8,I9];
        jueduizhi=abs(shuzu);
        paixu=[1,2,3,4,5,6,7,8;jueduizhi];
        for s=1:8
            for t=s+1:8
                if paixu(2,s)>paixu(2,t)
                    midd=paixu(2,s);
                    paixu(2,s)=paixu(2,t);
                    paixu(2,t)=midd;
                    midd1=paixu(1,s);
                    paixu(1,s)=paixu(1,t);
                    paixu(1,t)=midd1;
                end
            end
        end
        K(1)=shuzu(paixu(1,1));
        K(2)=shuzu(paixu(1,2));
        K(3)=shuzu(paixu(1,3));
        K(4)=shuzu(paixu(1,4));
        K(5)=shuzu(paixu(1,5));
        K(6)=shuzu(paixu(1,6));
        ave=(K(1)+K(2)+K(3)+K(4)+K(5)+K(6)+6*I(i,j))/6;
        X(i,j)=ave;
    end
end
pic=im2uint8(X);
subplot(2,3,5);
imshow(pic);
title('灰度最相近的K个邻点平均法');
        
                    
        
        
