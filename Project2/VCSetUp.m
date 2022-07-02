%Setting Up Viet Cong
hvc1=imread('VC.jpg');
hvc2=imresize(hvc1,.35);
hvc=imshow(hvc2);
set(hvc,'Xdata',numcols_background);
set(hvc,'Ydata',(rand()*.25+.48)*numrows_background);
for jj=numcols_background:-5:-80
    set(hvc,'Xdata',jj);
    pause(T)
end