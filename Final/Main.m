% Documentation - https://sites.google.com/a/asu.edu/fse100-cse-wiki/ev3-matlab-library-documentation
% brick = ConnectBrick('ROBOT');


global key
InitKeyboard();

brick.beep(); 
brick.SetColorMode(4, 2);

lastcolor = 9;  % Variable initialized with a random color
pauseTime = 1.5;


while 1
   pause(0.1)
      
   color = brick.ColorCode(4);
   started = false;
   
   
   if color == 2     % Blue - Pick up passenger
       brick.StopMotor('AD');
       disp("Blue Detected");
   elseif color == 4   % Yellow - Drop off passenger
       brick.StopMotor('AD');
       disp("Yellow Detected");
   elseif color == 3   % Green - Start the vehicle
       %pause(4)
       %brick.GyroCalibrate(3);
       if(started == true)
           brick.StopAllMotors();
       end
       brick.MoveMotor('AD', -50); 
       disp("Green Detected");
       started = true;
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
           brick.StopMotor('AD')
       case 'rightarrow'  % Turn right
           brick.StopAllMotors();
           brick.MoveMotor('A', 50);
           pause(1.2);
           brick.StopAllMotors();
       case 'leftarrow'   % Turn left
           brick.StopAllMotors();
           brick.MoveMotor('D', 50);
           pause(1.2);
           brick.StopAllMotors();
       case 'w'      %move claw up
           brick.MoveMotor('B',10);
       case 's'       %move claw down
            brick.MoveMotor('B',-10);
       case 'q'
           brick.StopAllMotors();
           pause(20);
   
   end
   
   touched = brick.TouchPressed(1);
   if touched
       brick.StopAllMotors();
       brick.MoveMotor('AD', 20);
       pause(1);
       turnOneEighty(brick, pauseTime);
   end    
   
   
   %Distance sensor
   distance = brick.UltrasonicDist(2);
   if distance > 60  % Wall detected
       turnRight(brick, pauseTime);
   end
             
end

CloseKeyboard();
