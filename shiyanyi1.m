MyYuanLaiPic = imread('sunset.jpg');%��ȡRGB��ʽ��ͼ��  
MyFirstGrayPic = rgb2gray(MyYuanLaiPic);%�����еĺ�������RGB���Ҷ�ͼ���ת��  
  
[rows , cols , colors] = size(MyYuanLaiPic);%�õ�ԭ��ͼ��ľ���Ĳ���  
MidGrayPic = zeros(rows , cols);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢������ķ��������ĻҶ�ͼ��  
MidGrayPic = uint8(MidGrayPic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double�͵�  
  
for i = 1:rows  
    for j = 1:cols  
        sum = 0;  
        for k = 1:colors  
            sum = sum + MyYuanLaiPic(i , j , k) / 3;%����ת���Ĺؼ���ʽ��sumÿ�ζ���Ϊ��������ֶ����ܳ���255  
        end  
        MidGrayPic(i , j) = sum;  
    end  
end  
  
%��ʾԭ����RGBͼ��  
figure(1);  
imshow(MyYuanLaiPic);  
title('ԭͼ��');
  
%��ʾ����ϵͳ����������ĻҶ�ͼ��  
figure(2);  
imshow(MyFirstGrayPic);  
title('�Ҷ�ͼ��');
   

bw = im2bw(MyYuanLaiPic,0.4);% 0.4��ʾ��ֵ��С��0.4��0������0.4��1
figure;
imshow(bw)
title('��ֵͼ��');


