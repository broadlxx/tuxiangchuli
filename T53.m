I=imread('xxb.png');
I=rgb2gray(I);
BW=edge(I,'roberts');
[rim,thresh1]=edge(I,'roberts');
figure;
subplot(1,2,1);
imshow(rim);
BW=edge(I,'roberts',0.05);
subplot(1,2,2);
I_reverse = imcomplement(rim);
imshow(I_reverse);