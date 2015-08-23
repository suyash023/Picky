vid=videoinput('winvideo',2,'RGB24_640x480');
triggerconfig(vid,'manual');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',Inf);
set(vid,'ReturnedColorSpace','rgb');
start(vid);
trigger(vid);
preview(vid);
for i=1:1000
end
 while(1)
    trigger(vid);
    im=getdata(vid,1);
    im=im2double(im);
    im4=hsvseg_im(im);
    [lab,n]=bwlabel(im4);
    if(bwarea(im4)>1000)
    [im1,cox,coy]=ob(im);
    [im2,cbx,cby,cbx1,cby1,th]=bot(im);
    im3=im1+im2;
    imshow(im3);
    hold on;
    plot(cbx,cby,'ro');
    plot(cbx1,cby1,'ro');
    plot(cox,coy,'ro');
    end
 end
    
    
    