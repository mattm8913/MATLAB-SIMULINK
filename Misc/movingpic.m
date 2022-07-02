% Frame rate
T=.01;
%% Background image with image icon
% Load backround image
figure(1)
imbackground=imread('bancroft.jpg');
% Code for finding size of image
numrows_background=size(imbackground,1);
numcols_background=size(imbackground,2); 
% Load icon image
imicon=imread('blueangel.jpg');

% Create figure window with background
hb=imshow(imbackground);
hold on
% Use imresize to make your icon image small
% 0.25 as used below makes the image 25% of the original
% This may vary depending on the size of your icon image
% See help imresize
hi=imshow(imresize(imicon,.25)); 
% Note: you could also create a cursor or fill object(s) here.

shg %show figure: brings window to the front
%To move the icon around, change the 'xdata' and 'ydata' for the handle of
%your icon
for y=0:.05*numrows_background:.95*numrows_background
    for x=0:.01*numcols_background:.95*numcols_background
        set(hi,'Xdata',x)
        set(hi,'Ydata',y)
        pause(T)
    end
end
% Notice that the y axis has been reversed. y=0 is in the upper left corner.
% This is an artifact of using the image command. The x axis is unchanged.
%% Plain background - no background picture
figure(2)
hi=image(imresize(imicon,.25));
hold on
axis([0 640 0 480])
shg %show figure: brings window to the front
%To move the icon around, change the 'xdata' and 'ydata' for the handle of
%your icon
for y=0:50:480
    for x=0:10:640
        set(hi,'Xdata',x)
        set(hi,'Ydata',y)
        pause(T)
    end
end
% Notice that again, the y axis has been reversed. y=0 is in the upper left
% corner. 