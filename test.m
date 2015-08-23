vid=videoinput('winvideo',2,'YUY2_320x240');
set(vid,'ReturnedColorSpace','rgb');
%triggerconfig(vid,'manual');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',Inf);
start(vid);
%preview(vid);
   %trigger(vid);
   while(1)
    im=getdata(vid,1);
    im=im2double(im);
    [im1,cox,coy,n]=ob(im);
    imshow(im1)
    end
    
        
        
    