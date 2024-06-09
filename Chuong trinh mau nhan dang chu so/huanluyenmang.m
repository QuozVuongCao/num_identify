% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City.
% Last updated    : Nov 11, 2014
%doc anh goc
clear all;
X=[]; %40 mau du lieu, moi mau co 96 dac trung
D=zeros(10,40);
for chuso = 0:9,
    for k=1:4,
        filename = ['So' int2str(chuso) '_' int2str(k) '.jpg'];
        img1=imread(filename);
        img2=rgb2gray(img1) %chuyen sang anh xam
        level = graythresh(img2); %chuyen sang anh nhi phan
        img3 = im2bw(img2,level);
        img4 = imresize(img3,[60 40]);
        x=trichdactrung(img4);
        X=[X x];
        D(chuso+1,chuso*4+k)=1;
    end;
end;

% hoan doi ngau nhien cac mau du lieu, tranh tinh trang huan
% luyen lien tuc 1 so mau co ngo ra giong nhau
temp=rand(1,40);
[temp,ind]=sort(temp);
X=X(:,ind);
D=D(:,ind);

Net=newff(X,D,10,{'tansig','purelin'});
Net=train(Net,X,D); %huan luyen mang

save mangnhandangchuso.mat Net
