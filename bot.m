function [im6,cbx,cby,cbx2,cby2,m] = bot( im1 )
[ro co x]=size(im1);
colors=[reshape(im1(:,:,1),(ro*co),1) reshape(im1(:,:,2),(ro*co),1) reshape(im1(:,:,3),(ro*co),1) ];
new=zeros([(ro*co) 1]);
test1=colors(:,1)-colors(:,2);
test2=colors(:,2)-colors(:,1);
test3=colors(:,3)-colors(:,2);
test4=colors(:,1)-colors(:,3);
test5=-test3;
test6=-test2;
new=zeros([(ro*co) 1]);
new(:,1)=((test4(:,1)>=0.10)&(test5(:,1)>=0.15)&(test1(:,1)<=0.15)&(test1(:,1)>=-0.15));
new=reshape(new,ro,co);
new1=zeros([(ro*co) 1]);
new1(:,1)=((test1(:,1)>=0.15)&(test4(:,1)>=0.15));
new1=reshape(new1,ro,co);
im2=mat2gray(new);
im3=mat2gray(new1);
im4=imfill(im2,'holes');
im4=bwareaopen(im4,300);
im4=imclearborder(im4);
lab1=bwlabel(im4);
im5=imfill(im3,'holes');
im5=bwareaopen(im5,300);
im5=imclearborder(im5);
lab2=bwlabel(im5);
c1=regionprops(lab1,'Centroid');
c2=regionprops(lab2,'Centroid');
cbx=c1(1).Centroid(1);
cby=c1(1).Centroid(2);
cbx1=c2(1).Centroid(1);
cby1=c2(1).Centroid(2);
m=(cby-cby1)/(cbx-cbx1);
cbx2=(cbx1+cbx)/2;
cby2=(cby+cby1)/2;
im6=im4+im5;
end

