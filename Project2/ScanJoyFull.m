function [but,good,xax,yax]=ScanJoyFull(s)
            dat=fscanf(s); 
            try
            [hdr,but,xax,yax,thr]=strread(dat,'%s%d%d%d%s',1,'delimiter',',');
            good=1;
            catch
            but=0;
            xax=0;
            yax=0;
            good=0;
            end
end