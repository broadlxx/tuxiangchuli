clc 
clear 
fn='iris.tif'; 
I=imread (fn); 
J=I; 
%计算灰度图象的直方图数据 
L=256; %灰度级 
Ps = zeros(L,1); %统计直方图结果数据 
nk=zeros(L,1); 
[row,col]=size(I); 
n=row*col; %总像素个数 
for i = 1:row 
for j = 1:col 
num = double(I(i,j))+1; %获取像素点灰度级 
nk(num) = nk(num)+1; %统计nk 
end 
end 

figure; 
subplot(3,1,1);imshow(J),title('原图'); 
subplot(3,1,2),plot(nk),title('编写的灰度直方图（nk）'); 
subplot(3,1,3),imhist(I),title('系统的计算的灰度直方图'); 

%figure(4),imhist(hist); 
%p=imhist(hist); %生成直方图函数,返回灰度图象直方图数据 
%figure(5),plot(p); 