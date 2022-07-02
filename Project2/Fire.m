%Fire
function [hbul,done]=Fire(hi,T,s,numcols_background,hvc,RamboTop,VCTop)
bullet=imread('bullet.jpg');
hbul=imshow(bullet);
RamboLeft=get(hi,'Xdata');
set(hbul,'Xdata',RamboLeft(1)+115);
set(hbul,'Ydata',RamboTop(1)+90);
pause(T)
for j=(RamboLeft(1)+115):90:1235
    set(hbul,'Xdata',j);
    [xax,good]=ScanJoyAx(s);
    if(good)
        if (xax>780)
            xax=780;
        end
        set(hi,'Xdata',xax/870*numcols_background)
        pause(T)
    end
    VCx=get(hvc,'Xdata');
    set(hvc,'Xdata',VCx(1)-10)
    pause(T)
    %VCRight=VCx(1)+82;
    %if(((VCx(1)-10)<=(RamboLeft(1)+115))&&((VCTop(1)+139)>=(RamboTop(1)))&&((VCTop(1))<=(RamboTop(1)+144))&&((VCx(1)+72)>=(RamboLeft(1))))
        %done=1;
        %fprintf('\n\nYou Died!!!\n');
        %break
    %else
        done=0;
    %end
    if(((j+57)>=(VCx(1)))&&(((RamboTop(1)+90)<=(VCTop(1)+139))&&((RamboTop(1)+108)>=(VCTop(1)))))
        set(hvc,'Xdata',numcols_background);
        set(hbul,'Xdata',-58);
        set(hbul,'Ydata',1);
        pause(T)
        break
    end
end
end