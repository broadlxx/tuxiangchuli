clc;
clear all;
I=imread('rice.png');
I=im2double(I);
figure;
imshow(I);
title('原始图像'); 
[height,width]=size(I); 
threshold_value=0.5;     
for i=2:height-1    
    for j=2:width-1      
        Dx=[I(i+1,j-1)-I(i-1,j-1)]+[I(i+1,j)-I(i-1,j)]+[I(i+1,j+1)-I(i-1,j+1)];      
        Dy=[I(i-1,j+1)-I(i-1,j-1)]+[I(i,j+1)-I(i,j-1)]+[I(i+1,j+1)-I(i+1,j-1)];       
        P(i,j)=sqrt(Dx^2+Dy^2);    
          if (P(i,j)>threshold_value)        
            P(i,j)=255;       
          else
              P(i,j)=0;
    end
    end
end
imshow(P);
title('prewitt边缘检测图像');

[ROW,COL] = size(I)
 Median_Img = double(I);
 Sobel_Threshold = 1.5;
 Sobel_Img = zeros(ROW,COL);
 for r = 2:ROW-1
     for c = 2:COL-1
         Sobel_x = Median_Img(r-1,c+1) + 2*Median_Img(r,c+1) + Median_Img(r+1,c+1) - Median_Img(r-1,c-1) - 2*Median_Img(r,c-1) - Median_Img(r+1,c-1);
         Sobel_y = Median_Img(r-1,c-1) + 2*Median_Img(r-1,c) + Median_Img(r-1,c+1) - Median_Img(r+1,c-1) - 2*Median_Img(r+1,c) - Median_Img(r+1,c+1);
         Sobel_Num = abs(Sobel_x) + abs(Sobel_y);
         %Sobel_Num = sqrt(Sobel_x^2 + Sobel_y^2);
         if(Sobel_Num > Sobel_Threshold)            
             Sobel_Img(r,c)=255;
         else
             Sobel_Img(r,c)=0;
         end
     end
 end 
 figure;
 imshow(Sobel_Img);
  title('Sobel边缘检测图像');