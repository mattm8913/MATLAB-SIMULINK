%% SAMPLE PROJECT 

% B. E. Bishop 
% 29 Oct 2009 
% Modified 
%   J. A. Piepmeier 
%   25 Oct 2010 
%   uses larger window size 
% Modified 
%   27 Oct 2010, BEB
%   Simplified impact detection method
%   Added polygon intersection test

%% Description 
% 
%  This project shows how to: 
%       generate a set of filled objects 
%       move them at random speeds along random paths 
%       determine if a target point is inside one of the objects 

%% Setup 
% 
%  Here, we defined the basic SHAPE of the objects 
%  Be sure to start AND END each set of data with the same point
%  This is required to guarantee that the collision detection occurs

% Object 1 is a rectangle 
x1dat = [-40 -40 40 40 -40]'; 
y1dat = [-30 30 30 -30 -30]'; 

% Object 2 is a triangle 
x2dat = [-40 0 40 -40]'; 
y2dat = [-40 40 -40 -40]'; 

% Object 3 is an odd shape 
x3dat = [-30 -20 -30 30 20 30 -30]'; 
y3dat = [-20 0 20 20 0 -20 -20]'; 

% Your ship
xcdat = [-15 -5 0 5 15 -15]';
ycdat = [-5 5 15 5 -5 -5]';

%% Generate graphics handles 
% 
% here, we plot each object and generate a handle to it so we can move it 
% later.  We'll use an array of handles to make it easy to loop through
% them.

figure(1); 
clf; 
width = 500 
height =375 
axis([0 width 0 height]); % figure is 500 units wide and 375 tall 
grid on; 
hold on; 
h(1) = fill(x1dat, y1dat, 'g');   % we use h(1) to represent object 1
h(2) = fill(x2dat, y2dat, 'r');   % we use h(2) to represent object 2
h(3) = fill(x3dat, y3dat, 'b');   % we use h(3) to represent object 3

%  Any additional objects are defined here

%% Place ship on screen 
% 
%  It is important to keep a handle to the ship so that you can modify 
%  its location using the joystick data. 
ship = fill(xcdat, ycdat, 'c');
xc = width/2;   % ship location in x
yc = 10;        % ship location in y
set(ship, 'Vertices', [xcdat + xc, ycdat + yc]);


%% Move objects to starting points 
% 
xpos = width*rand(3,1) ;  % Random starting x for each of the 3 
ypos = ones(3,1)*height;       % Start at top of window, y = 10 

for i = 1:3
    set(h(i), 'Vertices', [get(h(i), 'XData') + xpos(i), get(h(i), 'YData') + ypos(i)]); 
end
%  The set command sets the vertex locations to be the basic shape data 
%  plus some overall location.  Each base shape is effectively located at 
%  (0,0) to start, and then moved to xpos and ypos 

%% Get a speed for each object 
% 
%  Each object will move from top to bottom on the screen with a random 
%  speed 
speed = 50*rand(3,1) + 170;   % values between 170 and 220 units per second 

%% Determine frame rate 
% 
%  The faster the frame rate, the smoother the graphics 
%  If the frame rate is too high (the period too low), the system may slow 
%  down dramatically due to processor overload. 
T = 0.01;    % 100 hz 

%% Clear out serial buffer
% You may also want to decrease the buffer size to reduce the number of old
% data stored.  Use set(s, 'InputBufferSize', 50); or a similar number

% ***Uncomment the following lines to clear out the buffer***
% while(get(s, 'BytesAvailable') > 0)   % change 's' to the name you used for the serial object
%    d = fread(s, 1);
% end

%% Move objects on screen
% 
% This loop moves the objects from top to bottom on the screen, resetting 
% each object's location when it goes off the bottom of the screen 
done = 0;  % a flag to determine if the game is over
while (done == 0)  % keep going until the game is over 
   pause(T);  % this is the way that we force the framerate   
   for i = 1:3             % Three objects 
       set(h(i), 'YData', get(h(i), 'YData') - speed(i)*T);  % position updated by speed*time 
       if (max(get(h(i), 'YData')) < -10)       %  if it went off the screen 
           speed(i) = 50*rand() + 170;          %  get a new speed 
           xposnew = width*rand();              %  get a new x position 
           xdat = get(h(i), 'XData');           %  current x locations
           xmid = min(xdat) + (max(xdat) - min(xdat))/2;    %  approximate middle
           set(h(i), 'XData', get(h(i), 'XData')- xmid + xposnew);  % move the object to the new position 
           ydat = get(h(i), 'YData');
           set(h(i), 'YData', ydat + (height - min(ydat)));  % moves the object off the top of the screen 
       end 
   end 
    
   % Update cursor location using the joystick 
   % 
   %   Read joystick data and extract all of the variables   
   %       (be sure to have initialized the serial port and turned on the hardware) 
   %   If you got good data: 
   %       speed_x = 2*(xax - 511);     % You will probably need to adjust 
   %                                    % the zero position from 511 to 
   %                                    % whatever your joystick defaults to 
   %       newx = get(ship, 'Xdata') + speed_x*T; 
   %       Check to see that you stay on the screen... force it to do so 
   %           That is, if your newx is off the screen, set it to the edge of 
   %           the screen.  You can use max and min to find out if the
   %           edges of your ship polygon are on the screen
   %       set(ship, 'Xdata', newx); 
   %   Otherwise  
   %       Display a message indicating that the joystick needs to be 
   %       connected. 
    
    
   %  The following lines check for collision between the cursor and the 
   %  moving polygons 
    
   xc = get(ship, 'Xdata');    % just in case of problems, make sure you have the 
   yc = get(ship, 'Ydata');    % actual position of the cursor when you check for 
                            % collisions 
   for i = 1:3
        if (~isempty(polyxpoly(xc, yc, get(h(i), 'XData'), get(h(i), 'YData'))))   
          disp('Hit!'); 
           text(0, 100, ['Hit by object ', num2str(i), '!!']);
           done = 1;  % game over
           break;
       end
   end
end 
