clc;clear all;
img=imread('rice.png');
figure;
subplot(2,3,1);imshow(img,[]);title('a)原始图像');

b=fftshift(fft2(img));

b1=abs(b);
b2=angle(b);
b3=zeros(256,256);b3(1:256,1:256)=b1(1:256,1:256);
subplot(2,3,2);imshow(log(b3),[]);title('b)原始图像幅度谱');

c=b;c1=log(abs(c));
h1=128;
w1=128;
sita2=0:0.05:2*pi;
subplot(2,3,3);imshow(c1,[]),hold on;
plot(h1+25*cos(sita2),w1+25*sin(sita2),'black');
fill(h1+25*cos(sita2),w1+25*sin(sita2),'black');
hold off;
title('c)理想高通滤波后频率谱');

[M,N]=size(b);%计算图像的高和宽
d0=50;nn=2;%截止频率为50的二阶巴特沃斯低通滤波器
m=round(M/2);n=round(N/2);%数据取整
for i=1:M
    for j=1:N
        d=sqrt((i-m)^2+(j-n)^2);%计算频率平面原点到各点的距离
        h=1/(1+0.414*(d/d0)^(2*nn));%传递公式
        result(i,j)=h*b(i,j);%滤波公式
    end
end
d=result;
h2=128;
w2=128;
sita2=0:0.05:2*pi;
subplot(2,3,5);imshow(log(abs(d)),[]),hold on;
plot(h2+25*cos(sita2),w2+25*sin(sita2),'black');
fill(h2+25*cos(sita2),w2+25*sin(sita2),'black');
hold off;
title('d)巴特沃斯高通通滤波器后图像幅度谱');

result=ifftshift(result);%直流分量移回到左上角
I2=ifft2(result);%傅里叶反变换
I3=uint8(real(I2));%取幅值并转换成8位无符号整数
subplot(2,3,6);imshow(I3);title('e)巴特沃斯高通通滤波器后图像');




