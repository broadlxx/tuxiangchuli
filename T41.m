clc;clear all;
img=imread('wire.bmp');
figure;
subplot(2,3,1);imshow(img,[]);title('a)原始图像');

saltimg=imnoise(img,'salt & pepper',0.04);
subplot(2,3,2);
imshow(saltimg);
title('b)添加jiaoyan噪声图像');

b=fftshift(fft2(saltimg));

b1=abs(b);
b2=angle(b);
b3=zeros(486,486);b3(1:486,1:486)=b1(1:486,1:486);
subplot(2,3,3);imshow(log(b3),[]);title('c)原始图像幅度谱');


%c=zeros(256,256);c(1:256,1:256)=b1(1:256,1:256);
c=zeros(242,308);c(100:156,100:156)=b1(100:156,100:156);
c1=log(abs(c));  %显示滤波后的频谱图
subplot(2,3,4);imshow(c1,[]);title('d)理想低通滤波器后图像幅度谱');

[M,N]=size(b);%计算图像的高和宽
d0=50;nn=2;%截止频率为50的二阶巴特沃斯低通滤波器
m=round(M/2);n=round(N/6);%数据取整
for i=1:M
    for j=1:N/3
        d=sqrt((i-m)^2+(j-n)^2);%计算频率平面原点到各点的距离
        h=1/(1+0.414*(d/d0)^(2*nn));%传递公式
        result(i,j)=h*b(i,j);%滤波公式
    end
end
d=zeros(486,486);d(100:156,100:156)=result(100:156,100:156);
subplot(2,3,5);imshow(log(abs(d)),[]);title('d)巴特沃斯低通滤波器后图像幅度谱');

result=ifftshift(result);%直流分量移回到左上角
I2=ifft2(result);%傅里叶反变换
I3=uint8(real(I2));%取幅值并转换成8位无符号整数
subplot(2,3,6);imshow(I3);title('d)巴特沃斯低通滤波器后图像');

