% Documentation - https://sites.google.com/a/asu.edu/fse100-cse-wiki/ev3-matlab-library-documentation
global key
InitKeyboard();

brick.beep(); 
brick.SetColorMode(1, 2);        % (port, mode)

while 1
    pause(0.1);
    switch key
        
        case 'downarrow'
            %{
            % Color Detection
            color = brick.ColorCode(1);
            if color == 2
                disp("Blue");
            elseif color == 4
                disp("Yellow");
            elseif color == 3
                disp("Green");
            elseif color == 5
                disp("Red");
            else
                disp("Unknown Color");
            end
            %}
            
            %{
            % Distance Detection
            distance = brick.UltrasonicDist(4);
            if distance < 15
                brick.beep();
            end
            %}
            
        case 'q'
            break;
    end
 
end
CloseKeyboard();