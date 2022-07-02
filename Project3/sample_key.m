%% Basic Window Event usage
%
% * B. E. Bishop, 6 Nov 2009

function sample_key()      %   This is your main function
k = figure(1);          %   Make figure 1 the current, get a handle k
clf;                    %   Clear the figure
set(k, 'KeyPressFcn', @read_keys);    % Set up to run read_keys
                                            % whenever a key is pressed
                                            % when figure 1 is selected
h = plot(0,0,'d');          % Plot a diamond
set(h, 'MarkerSize', 20);   % Scale it up
axis([-10 10 -10 10]);      % Set axes
p = ' ';                    % The character read from the keyboard (initially space)
while(1)                    
        try
            if (p == '+')       % Sets title based on key read
                set(h, 'Marker', '+');
                title('Plus Sign');
            end
            if (p == 'o' || p == 'O' || p == '0')
                set(h, 'Marker', 'o');
                title('Circle');
            end
            if (p == 'x' || p == 'X')
                set(h, 'Marker', 'x');
                title('Ecks');
            end
            if (p == 'q' || p == 'Q')
                title('Done');
                set(h, 'MarkerSize', 1);
                return
            end
            p = ' ';    % clear the pressed key so we only execute the change once
        catch
        end
        pause(0.01);
end

    function read_keys(k, eventdata)    % This function runs when you press
                                        % a key when figure 1 is active
        p = eventdata.Character;        % Gets the character pressed
        xlabel(eventdata.Character);    % Puts it as the xlabel
    end
end