%SettingUpImage
while(get(s, 'BytesAvailable') > 0)
    d = fread(s, 1);
end
T=.001;
figure(1)
imbackground=imread('Jungle.jpg');
imback=imresize(imbackground,.7);
numrows_background=size(imback,1);
numcols_background=size(imback,2);
imicon=imread('Rambo.jpg');
hb=imshow(imback);
hold on
hi=imshow(imresize(imicon,.3));
set(hi,'Xdata',0.45*numcols_background)
set(hi,'Ydata',.723*numrows_background)
hvc1=imread('VC.jpg');
hvc2=imresize(hvc1,.35);
hvc=imshow(hvc2);
set(hvc,'Xdata',numcols_background);
set(hvc,'Ydata',(rand()*.25+.48)*numrows_background);
pause(2)
%Action
while(get(s, 'BytesAvailable') > 0)
    d = fread(s, 1);
end
done=0;
while(done==0)
    set(hvc,'Ydata',(rand()*.25+.48)*numrows_background);
    VCTop=get(hvc,'Ydata');
    VCx=get(hvc,'Xdata');
    if VCx(1)<=-80
        VCx=numcols_background;
        set(hvc,'Xdata',VCx(1));
    end
    while VCx(1)>-80
        set(hvc,'Xdata',VCx(1)-10);
        pause(T)
        RamboLeft=get(hi,'Xdata');
        RamboTop=get(hi,'Ydata');
            if(((VCx(1)-10)<=(RamboLeft(1)+115))&&((VCTop(1)+139)>=(RamboTop(1)))&&((VCTop(1))<=(RamboTop(1)+144))&&((VCx(1)+72)>=(RamboLeft(1))))
                done=1;
                fprintf('\n\nYou Died!!!\n');
                break
            end
        [but,good,xax,yax]=ScanJoyFull(s);
      if (good)
                if (xax>780)
                    xax=780;
                end
            set(hi,'Xdata',xax/870*numcols_background);
            pause(T)
            if(bitand(but, 2^5)==0)
                [hbul,done]=Fire(hi,T,s,numcols_background,hvc,RamboTop,VCTop);
                while(bitand(but, 2^5)==0)
                    [but]=ScanJoyBut(s);
                end
            end
        if(bitand(but, 2^2)~=4)
            for ii=0:.05:.35
                set(hi,'Ydata',(.723-ii)*numrows_background);
                pause(T)
                [but,xax]=ScanJoyButAx(s);
                    if (good)
                        if (xax>780)
                            xax=780;
                        end
                        set(hi,'Xdata',xax/870*numcols_background);
                        pause(T)
                        if(bitand(but, 2^5)==0)
                            [hbul,done]=Fire(hi,T,s,numcols_background,hvc,RamboTop,VCTop);
                            while(bitand(but, 2^5)==0)
                                [but]=ScanJoyBut(s);
                            end
                        end
                        VCx=get(hvc,'Xdata');
                        if(VCx(1)==numcols_background)
                            set(hvc,'Ydata',(rand()*.25+.48)*numrows_background);
                            VCTop=get(hvc,'Ydata');
                        end
                        set(hvc,'Xdata',VCx(1)-10);
                        pause(T)
                        RamboLeft=get(hi,'Xdata');
                        RamboTop=get(hi,'Ydata');
                        if(((VCx(1)-10)<=(RamboLeft(1)+115))&&((VCTop+139)>=(RamboTop(1)+144))&&((VCTop(1))<=(RamboBottom(1)))&&((VCx(1)+72)>=(RamboLeft(1))))
                            done=1;
                            fprintf('\n\nYou Died!!!\n');
                            break
                        end
                    end
            end
            pause(.01)
            for ii=.35:-.05:0
                set(hi,'Ydata',(.723-ii)*numrows_background)
                pause(T)
                [but,xax]=ScanJoyButAx(s);
                if(good)
                    if (xax>780)
                        xax=780;
                    end
                    set(hi,'Xdata',xax/870*numcols_background);
                    pause(T)
                    if(bitand(but, 2^5)==0)
                        [hbul,done]=Fire(hi,T,s,numcols_background,hvc,RamboTop,VCTop);
                        while(bitand(but, 2^5)==0)
                            [but]=ScanJoyBut(s);
                        end
                    end
                    VCx=get(hvc,'Xdata');
                    if(VCx(1)==numcols_background)
                        set(hvc,'Ydata',(rand()*.25+.48)*numrows_background);
                        VCTop=get(hvc,'Ydata');
                    end
                    set(hvc,'Xdata',VCx(1)-10);
                    pause(T)
                    RamboLeft=get(hi,'Xdata');
                    RamboTop=get(hi,'Ydata');
                    if(((VCx(1)-10)<=(RamboLeft(1)+115))&&((VCTop+139)>=(RamboTop(1)))&&((VCTop(1))<=(RamboTop(1)+144))&&((VCx(1)+72)>=(RamboLeft(1))))
                        done=1;
                        fprintf('\n\nYou Died!!!\n');
                        break
                    end
                end
            end
            while(bitand(but, 2^2)~=4)
                [but]=ScanJoyBut(s);
            end
        end
      end
      VCx=get(hvc,'Xdata');
        if(VCx(1)==numcols_background)
            set(hvc,'Ydata',(rand()*.25+.48)*numrows_background);
            pause(T)
        end
    end
end