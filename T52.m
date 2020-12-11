clear all;
f=imread('bottle.tif');
[m,n]= size(f);
point=20;
for i=1:m
    for j=1:n
        if f(i,j)>=point
            bin(i,j)=1;
        else
            bin(i,j)=0;
        end
    end
end

imshow(bin);