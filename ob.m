function [ im3,cox,coy,n ] = ob( im1 )
[ro co x]=size(im1);
colors=[reshape(im1(:,:,1),(ro*co),1) reshape(im1(:,:,2),(ro*co),1) reshape(im1(:,:,3),(ro*co),1) ];
test1=colors(:,1)-colors(:,2);
test2=colors(:,2)-colors(:,1);
test3=colors(:,3)-colors(:,2);
test4=colors(:,1)-colors(:,3);
test5=-test3;
test6=-test2;
new=zeros([(ro*co) 1]);
new(:,1)=(colors(:,1)>=0.20&colors(:,1)<=0.40&colors(:,2)>=0.20&colors(:,2)<=0.40&colors(:,3)>=0.20&colors(:,3)<=0.40);
new=reshape(new,ro,co);
im2=mat2gray(new);
im3=imfill(im2,'holes');
im3=bwareaopen(im3,100);
[lab,n]=bwlabel(im3);
c=regionprops(lab,'Centroid');
for i=1:n
    cox(i,1)=c(i).Centroid(1);
    coy(i,1)=c(i).Centroid(2);
end
end
