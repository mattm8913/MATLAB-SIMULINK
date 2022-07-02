%% 2D Plotting
%  We will investigate the basic capabilities of MATLAB

%% Data for 2D plots:  Single Vector

%%
% 2D plots use one or two vectors
% If one vector is used, plot shows data on the y-axis plotted against the
% index values (1st element has x = 1, 2nd has x = 2).  We usually label
% the x-axis as 'Sample' or 'Sample Number'

%%
x = exp(1:10);
plot(x)
xlabel('Sample');
ylabel('e^x');
title('Plotting with one vector');

%%
% *NOTE*:  Always include the labels AFTER the plotting command.

%%  Data for 2D plots:  Two vectors
% When plotting a standard x,y function, you need to make sure that the
% vectors are the same length or you will get an error.  
% If x and y are the same length, the system will plot the (x,y) pairs
% and, by default, draw straight lines between each data point

x = [0 2 3 7 9];
y = [1 4 2 6 -1];
plot(x,y);
xlabel('X');
ylabel('Y');
title('Plotting with two vectors');

%% Linetypes
% The basic set of line parameters have to do with three things:
% 1)  Line color
% 2)  Marker style
% 3)  Line type

help plot
plot(x,y,'r+--');
xlabel('X');
ylabel('Y');
title('Plotting with line properties');

%% Marker Basics
% If you use markers, you must specify the line type or you will get only
% the data markers:
plot(x,y,'d');
xlabel('X');
ylabel('Y');
title('Plotting with markers');

%% Marker Properties
% You have a great deal of control over your data markers in MATLAB.  You
% set the basic shape using the method above, but you can also modify:
%
% * LineWidth — Specifies the width (in points) of the line.  Value is a
%  NUMBER
% * MarkerEdgeColor — Specifies the color of the marker or the edge
%     color for for filled markers (circle, square, diamond, pentagram,
%     hexagram, and the four triangles).  Value can be standard from the
%     plot line properties list, or a set of [R G B] values between 0 and
%     1.
% * MarkerFaceColor — Specifies the color of the face of filled
%     markers.  Has same style as MarkerEdgeColor.
% * MarkerSize — Specifies the size of the marker in points (must be
%     greater than than 0).  Value is a NUMBER.
%
% To modify these properties, simply include: 'Propertyname', value as
% many times as needed in the command

plot(x,y,'d-', 'LineWidth', 3, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'g', 'MarkerSize', 15)
xlabel('X');
ylabel('Y');
title('Plotting with Marker Controls');

%% Plotting multiple traces on a single plot
%
% It is often useful to put multiple line graphs on a single plot for
% visualization.  There are two basic ways to do this:
%
% * |hold|
% * |plot| with multiple data sets

x1 = 0:0.2:7;
y1 = exp(x1).*sin(x1);
y2 = 10*exp(x1/2).*sin(x1*10);
plot(x1, y1, 'r', x1, y2, 'g');
xlabel('X');
ylabel('Y');
title('Plotting with two data sets');
%%
%  Note that it would be better to reduce the step size in the x1 variable
%  to reduce the jagginess of the lines:

x1 = 0:0.01:7;
y1 = exp(x1).*sin(x1);
y2 = 10*exp(x1/2).*sin(x1*10);
plot(x1, y1, 'r', x1, y2, 'g');
xlabel('X');
ylabel('Y');
title('Plotting with two data sets');

%% Annotating Plots
%
%  It is easy to add descriptions and annotations to your plots.  There are
%  several commands that will help you do this:
%
% * legend
% * text
% * gtext

plot(x1, y1, 'r', x1, y2, 'g');
xlabel('X');
ylabel('Y');
title('Plotting with two data sets');
legend('e^x sin(x)', '10e^{x/2}sin(10x)');
text(2, 200, 'Instability');

%%
% gtext is like text, except you use the cursor to place the text string
% 
% There are also many tools on the Figure window as well...

%% Data Fitting
%
%  It is possible to generate best-fit curves using MATLAB's built-in data
%  analysis functions.  The easiest way to do this is to use the toolbar
%  after you have plotted data:

x = 0:0.5:5;                %  input values
y = 3*x.^2 + 2*x + 5;       %  2nd order polynomial
y = y + 5*rand(size(y));   %  Add some noise
subplot(1,1,1)
plot(x,y,'d');
xlabel('Input x');
ylabel('Output y');
title('Data Fitting Example')
M = fit(x',y','poly2')
hold on;
plot(M, 'r');
text(0.5, 90, ['y = ', num2str(M.p1), 'x^2 + ', num2str(M.p2), 'x + ', num2str(M.p3)]);
hold off

%%
% There are many other data fitting options.  Type CFLIBHELP in the Command
% Window to see the options, or use the GUI.

%% Setting Axis Limits
%
% It is often useful to adjust the limits on the axes after a plot, in
% order to get a better view of the area.  
%
% You use the |axis| command to both check and set the axis limits for the
% plot.  To do so:
%
% 1) Read the current axis settings using |v = axis;|
%
% 2) Set the axis limits using one of these common commands:
%
% * |axis([xmin xmax ymin ymax])|
% * |axis('equal')|, which sets the scale on both axes to be the same

x = [1 2 5];
y = [0 -1 1];
plot(x,y,'r+');
xlabel('X');
ylabel('Y');
title('Badly scaled image');
v = axis

%%
% Now, we re-scale the image to look better and let us see the values

plot(x,y,'+');
xlabel('X');
ylabel('Y');
title('Well-scaled image');
axis([min(x)-1, max(x)+1, min(y)-1, max(y)+1]);  % We use the data to set our axis limits
axis('equal');


%% Subplots
%
% It is possible to put several plots into the same figure using the
% |subplot| command.
% 
% * |suplot(# rows, # columns, index)| where the |index| is the number,
% between 1 and (# rows)*(# cols), counting along each row from top to
% bottom:

for i = 1:6
    subplot(3,2,i);
    plot(rand(1, ceil(rand(1)*100)));
    title(['Plot #', num2str(i)])
end

%% Multiple Figure Windows
%
% You will often want to have several plots that are not part of the same
% figure.  To handle this, use the |figure| command 

figure(2);
plot(rand(100,1), 'd');
xlabel('Sample');
ylabel('Data');
title('Image in new Figure');

%%
% But the last figure we printed, which is figure 1, is still available

figure(1);
hold on;
plot(sin(0:0.1:100), 'r');

%% Moving Markers Without Re-Plotting
%
% In many cases, you will want to do an animation that involves moving an
% object in a figure without necessarily re-plotting all of the data.  This
% is done by using *handles* and associated properties.
%
% We will also investigate different methods for generating objects in an
% image.

clf(1);   % clears all of the properties of figure 1
fill([0 0 2 2], [0 2 2 0], 'r');
hold on;
text(2,2, 'Heated Area');
fill([3 3 4 4], [3 5 5 3], 'b');
text(4,5, 'Cooled Area');
axis('equal');
h = plot(1,1,'d', 'LineWidth', 2, 'MarkerFaceColor', 'y', 'MarkeredgeColor', 'g', 'MarkerSize', 20);
xlabel('X (m)');
ylabel('Y (m)');
title('Using graphics handles:  state 1');
%%
% If we were to move the data marker the old way, we would need to re-draw
% the entire image.  This is not always practical, and is often costly in
% terms of storage and processing.
%
% Instead, we will use the |set| command to change the location of the data
% marker:

set(h, 'XData', 3);
set(h, 'YData', 4);
title('Using graphics handles:  state 2');
% Notice that the marker *moved* from one position to another without
% changing the red rectangle and without re-drawing anything.

%%
% For markers, You can change the following, using the same notation as was used above
% and with the same style of parameters used to describe the marker
%
% * Color
% * LineStyle
% * LineWidth
% * Marker
% * MarkerSize
% * MarkerEdgeColor
% * MarkerFaceColor
% * XData
% * YData

set(h, 'Marker', 'o', 'MarkerSize', 15, 'MarkerFaceColor', 'm');
title('Using graphics handles:  state 3');

%% 
% You can do the same sort of thing with the |fill| objects as well, with
% slightly different parameters.
%
% Whenever you want to know what you can set for a handle, just use
% |get(h)| where |h| is the handle returned when you generated the object

hg = fill([1 1 2 3 2], [3 4 4 3.5 3], 'g');
title('Using graphics handles:  state 4');
%%

set(hg, 'Xdata', [get(hg, 'Xdata') + 2]);
title('Using graphics handles:  state 5');

%% Animation and Movies
%
% To show results that are not static, it is often useful to generate
% movies, both for use in MATLAB and for general use elsewhere.  The
% standard method is to:
% 
% * Generate a plot
% * Store the plot as a frame
% * Repeat until completed
% * Generate a |movie| object
% * Convert the |movie| to a standard video file format
%
% This is typically done like this:
% F = [];
% for j = 1:n	plotting commands
% 	F(j) = getframe;  %  or F = [F; getframe];
% end
% movie(F);
% movie2avi(F, 'mymovie.avi');

clf;
x = 1;
y = 1;
h = plot(x, y, 'd', 'MarkerSize', 15, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'r', 'LineWidth', 3);
axis([0 10 0 10]);
grid on;
xlabel('X (m)');
ylabel('Y (m)');
title('Making Movies Example');
text(1, 8.5, 'Making Movies');
F = [];
for i = 1:10
    xnew = round(10*rand(1));
    ynew = round(10*rand(1));
    for j = 1:20
        set(h, 'XData', x+ (xnew - x)*j/20);
        set(h, 'YData', y+ (ynew - y)*j/20);
        pause(0.01);
        F = [F; getframe];
    end
    x = xnew;
    y = ynew;
end
% It is important to set the quality to an appropriate level.  In order for
% the movie to be of presentation quality, some care must be taken.

% Uncomment to actually make the videos
% movie(F)
% movie2avi(F, 'Fdefault.avi');
% movie2avi(F, 'FhighQ.avi', 'quality', 100);
% movie2avi(F, 'Fhuge.avi', 'compression', 'none');
% movie2avi(F, 'FIndeo3.avi', 'compression', 'Indeo3', 'quality', 100);
% movie2avi(F, 'Fcine.avi', 'compression', 'Cinepak', 'quality', 100);