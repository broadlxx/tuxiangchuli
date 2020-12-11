clc;clear all;
I = imread('rice.png');
edge=uint8(zeros(size(I)));
figure;subplot(2,2,1);
imshow(I),title("原图像");

  

[ROW,COL] = size(I);
img = double(I);
new_img = zeros(ROW,COL); %新建画布
T = 1;
%定义robert算子
roberts_x = [1,0;0,-1];
roberts_y = [0,-1;1,0];
for i = 1:ROW - 1
    for j = 1:COL - 1
        funBox = img(i:i+1,j:j+1);
        G_x = roberts_x .* funBox;
        G_x = abs(sum(G_x(:)));
        G_y = roberts_y .* funBox;
        G_y = abs(sum(G_y(:)));
        roberts_xy  = G_x * 0.5 + G_y * 0.5;
        if roberts_xy  >  T
            new_img(i,j) = 0;
        else
            new_img(i,j) = 255;
        end
            
        new_img(i,j) = roberts_xy;
    end
end
subplot(2,2,2);
imshow(new_img/255),title("robert算子的图像");

