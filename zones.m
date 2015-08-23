function [ im2,puz,dep ] = zones( im1 )
im1=im2double(im1);
[ro co x]=size(im1);
colors=[reshape(im1(:,:,1),(ro*co),1) reshape(im1(:,:,2),(ro*co),1) reshape(im1(:,:,3),(ro*co),1) ];
new=zeros([(ro*co) 1]);
new(:,1)=((colors(:,1)>=0.00)&(colors(:,2)>=0.00)&(colors(:,3)>=0.00)&(colors(:,1)<=0.05)&(colors(:,2)<=0.05)&(colors(:,3)<=0.05));
new=reshape(new,ro,co);
im2=mat2gray(new);
im2=imfill(im2,'holes');
im2=bwareaopen(im2,100);
[lab,n]=bwlabel(im2);
c=regionprops(lab,'Centroid');
for i=1:n
    if((c(i).Centroid(1)<(co/2))&&(c(i).Centroid(2)>(ro/2)))
        puz=c(i).Centroid;
    end
    if((c(i).Centroid(1)>(co/2))&&(c(i).Centroid(2)>(ro/2)))
         dep=c(i).Centroid;
    end
end
end

