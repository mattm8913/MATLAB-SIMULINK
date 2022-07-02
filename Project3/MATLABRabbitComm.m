%Lab #10
% Init serial code in another file or at command prompt
% ONLY DO THIS ONCE
% Baud rate:  9600
% Parity:  0
% Stop Bits:  1
% Flow Control:  None

% Skeleton Code for MATLAB to Rabbit communication
clc
while(1)
    if(get(s,'BytesAvailable')>0)
        a=fread(s,1);
        if a == 82 %ASCII Code for R
            fprintf('Rabbit says Right Bump Sensor has been hit\n')
        elseif a==76 %ASCII Code for L
            fprintf('Rabbit says Left Bump Sensor has been hit\n')
        end
    end
    pause(.5)%This is JUST FOR TESTING
    fwrite(s,'t')
     fprintf('Turn Command has been sent to Rabbit\n')
    pause(.5)%This is JUST FOR TESTING
    fwrite(s,'F')
     fprintf('Forward Command has been sent to Rabbit\n')
end
    
