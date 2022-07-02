function [but]=ScanJoyBut(s)
            dat=fscanf(s); 
            try
            [hdr,but,xax,yax,thr]=strread(dat,'%s%d%d%d%s',1,'delimiter',',');
            good=1;
            catch
            but=0;
            good=0;
            end
end