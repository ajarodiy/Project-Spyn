% Documentation - https://sites.google.com/a/asu.edu/fse100-cse-wiki/ev3-matlab-library-documentation
% brick = ConnectBrick('ROBOT');


global key
InitKeyboard();

brick.beep(); 
brick.SetColorMode(4, 2);

lastcolor = 9;  % Variable initialized with a random color


while 1
   pause(0.1)
      
   color = brick.ColorCode(4);
   
   
   if color == 2     % Blue - Pick up passenger
       brick.StopMotor('AD');
       disp("Blue Detected");
   elseif color == 4   % Yellow - Drop off passenger
       brick.StopMotor('AD');
       disp("Yellow Detected");
       %manualModeOn(brick, key)
       manual = true
       while 1
          switch key
              case 'uparrow'  % Start the vehicle
                  brick.MoveMotor('AD', -10)
              case 'downarrow'    % Stop the vehicle
                  brick.MoveMotor('AD', 10)
              case 'rightarrow'  % Claw up
                 brick.MoveMotor('A', -10)
              case 'leftarrow'   % Claw down
                  brick.MoveMotor('D', -10)
              case 'q'
                  manual = false
          end
       end
   elseif color == 3   % Green - Start the vehicle
       brick.MoveMotor('AD', -50); 
       %brick.GyroCalibrate(3);
       disp("Green Detected");
   elseif color == 5 && lastcolor ~= 5   % Detects red for first time - Pause the vehicle for 4 seconds
       disp("Red Detected")
       brick.StopMotor('AD');
       pause(4);    % Pauses for 4 seconds
       brick.MoveMotor('AD', -50);
   else
       %disp("Unknown Color");
   end
    
   lastcolor = color;
   
   % Manual control
   switch key
       case 'uparrow'  % Start the vehicle
           %brick.GyroCalibrate(3);
           brick.MoveMotor('AD', -50)
       case 'downarrow'    % Stop the vehicle
           brick.StopAllMotors();
       case 'rightarrow'  % Claw up
           brick.MoveMotor('C', -3)
       case 'leftarrow'   % Claw down
           brick.MoveMotor('C', 3)
           %turnLeft(brick)
       case 'q'
           brick.StopAllMotors();
           pause(20)
   
   end
  
   touched = brick.TouchPressed(1);
   
   if touched
       brick.StopAllMotors();
       brick.MoveMotor('AD', 10);
       pause(1);
       turnLeft(brick);
       turnLeft(brick);
   end 
 
   
   
   
   %Distance sensor
   distance = brick.UltrasonicDist(2);
   if distance > 50  % Wall detected
       brick.StopAllMotors();
       brick.MoveMotor('D', 50);
       pause(1.1);
       brick.StopAllMotors();
       pause(0.5)
       turnLeft(brick);
   end
   
       
end

CloseKeyboard();


%{
while 1
    pause(0.1);
    switch key            
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
%}
