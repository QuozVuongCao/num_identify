% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City.
% Last updated    : Nov 11, 2014

%doc anh goc
clc
clear all;

img1=imread('So2_3.jpg');
subplot(221);
imshow(img1);

img2=rgb2gray(img1); %chuyen sang anh xam
subplot(222);
imshow(img2);

level = graythresh(img2); %chuyen sang anh nhi phan
img3 = im2bw(img2,level);
subplot(223);
imshow(img3);

img4 = imresize(img3,[60 40]);
subplot(224);
imshow(img4);

x=trichdactrung(img4);

load mangnhandangchuso.mat

y=sim(Net,x);

[ymax,ind]=max(y);
if ymax<0.7,
    disp('Khong nhan dang duoc');
else
    disp(['Chu so vua doc la: ', int2str(ind-1)]);
end

