function GoRoomba(s)
k = figure(1);          %   Make figure 1 the current, get a handle k
clf;                    %   Clear the figure
set(k, 'KeyPressFcn', @read_keys);    % Set up to run read_keys
                                            % whenever a key is pressed
                                            % when figure 1 is selected
h = plot(0,0,'d');          % Plot a diamond
set(h, 'MarkerSize', 20);   % Scale it up
axis([-10 10 -10 10]);      % Set axes
p = ' '; % The character read from the keyboard (initially space)
T=.01;
done=0;
while (done~=1)
    try
            if (p == 'a' || p=='A')       
                title('Autonomous Mode');       %Set title to "Autonomous
                set(h, 'Marker', 's');          %Mode" and display graph
                set(h, 'MarkerEdgeColor', 'b'); %Accordingly
                set(h, 'MarkerFaceColor', 'y');
            end
            if (p == 'f')                  %Command "Move Forward"
                title('Move Forward');      %display a graph accordingly
                set(h, 'Marker', 'd');
                set(h, 'MarkerEdgeColor', 'b');
                set(h, 'MarkerFaceColor', 'b');
            end
            if (p == 'm')                  %Returns Manual Control to User
                title('Manual Control');    %display a graph accordingly
                set(h, 'Marker', 'd');
                set(h, 'MarkerEdgeColor', 'b');
                set(h, 'MarkerFaceColor', 'b');
            end
            if (p == 'b')                  %Command "Move Backward" 
                title('Move Backward');   %display a graph accordingly
                set(h, 'Marker', 'x');
                set(h, 'MarkerEdgeColor', 'b');
            end
            if (p == 'q' || p == 'Q')       %"Quit" Command
                title('Done');              %display a graph accordingly
                set(h, 'MarkerSize', 1);
                fwrite(s, 'q');
                done=1;
                return
            end
            if(p=='r')                      %Command "Rotate Right 45 deg"
                title('Rotate Right 45 deg'); %display a graph accordingly
                set(h, 'Marker', '+');
                set(h, 'MarkerEdgeColor', 'g');
            end
            if(p=='F')                      %Command "Step Forward"
                title('Step Forward');    %display a graph accordingly
                set(h, 'Marker', 'd');
                set(h, 'MarkerEdgeColor', 'b');
                set(h, 'MarkerFaceColor', 'b');
            end
            if(p=='R')                      %Command "180 Spin Right"
                title('180 Spin Right');   %display a graph accordingly
                set(h, 'Marker', '*');
                set(h, 'MarkerEdgeColor', 'b');
                set(h, 'MarkerFaceColor', 'm');
            end
            if(p=='l')                      %Command "Rotate Left 45 deg"
                title('Rotate Left 45 deg'); %display a graph accordingly
                set(h, 'Marker', '+');
                set(h, 'MarkerEdgeColor', 'r');
            end
            if(p~=' ')
            fwrite(s, p); %send the value of "p" only if
            end             %p was set to a pressed key
            p = ' ';    % clear the pressed key so we only execute the change once
     catch
     end
     if(get(s,'BytesAvailable')>0) %if we receive data
        a=fread(s,1);               %(meaning a bumper was hit)
        if a == 82 %ASCII Code for R% then display the message
            fprintf('Rabbit says Right Bump Sensor has been hit\n')
            set(h, 'Marker', '>');
            set(h, 'MarkerEdgeColor', 'g');
            set(h, 'MarkerFaceColor', 'g');
        elseif a==76 %ASCII Code for L
            fprintf('Rabbit says Left Bump Sensor has been hit\n')
            set(h, 'Marker', '<');
            set(h, 'MarkerEdgeColor', 'r');
            set(h, 'MarkerFaceColor', 'r');
        elseif a==83 %ASCII Code for S
            fprintf('Rabbit bumped something\n') %used in autonomous
            set(h, 'Marker', '^');               %mode to simply display
            set(h, 'MarkerEdgeColor', 'c');     %that a bumper was hit
            set(h, 'MarkerFaceColor', 'c');     %without specifying which
            title('Rabbit bumped something');    %one
        end
     end
     pause(T);
end
    function read_keys(k, eventdata)    % This function runs when you press
                                        % a key when figure 1 is active
        p = eventdata.Character;        % Gets the character pressed
        xlabel(eventdata.Character);    % Puts it as the xlabel
    end                                 % and assigns its value to "p"
end