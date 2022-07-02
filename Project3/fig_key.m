function fig_key()
k = figure(1);          %   Make figure 1 the current, get a handle k
clf;                    %   Clear the figure
set(k, 'KeyPressFcn', @read_keys);    % Set up to run read_keys
                                            % whenever a key is pressed
                                            % when figure 1 is selected
h = plot(0,0,'d');          % Plot a diamond
set(h, 'MarkerSize', 20);   % Scale it up
axis([-10 10 -10 10]);      % Set axes
p = ' ';                    % The character read from the keyboard (initially space)
T=.01;
done=0;
while (done~=1)
    try
            if (p == 'a' || p=='A')       % Sets title based on key read
                title('Autonomous Mode');
            end
            if (p == 'f')                  %Command "Move Forward"
                title('Move Forward');
            end
            if (p == 'b')                  %Command "Move Backward" 
                title('Move Backward');
            end
            if (p == 'q' || p == 'Q')       %"Quit" Command
                title('Done');
                set(h, 'MarkerSize', 1);
                done=1;
                return
            end
            if(p=='r')                      %Command "Rotate Right 90 deg"
                title('Rotate Right 90 deg');
            end
            if(p=='F')                      %Command "Step Forward"
                title('Step Forward');
            end
            if(p=='R')                      %Command "360 Spin Right"
                title('360 Spin Right');
            end
            if(p=='l')                      %Command "270 Spin Right"
                title('270 Spin Right');
            end
            p = ' ';    % clear the pressed key so we only execute the change once
        catch
        end
        pause(T);
end
    function read_keys(k, eventdata)    % This function runs when you press
                                        % a key when figure 1 is active
        p = eventdata.Character;        % Gets the character pressed
        xlabel(eventdata.Character);    % Puts it as the xlabel
    end
end