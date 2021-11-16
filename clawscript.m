global key
InitKeyboard();

brick.beep(); 
brick.SetColorMode(4, 2);

lastcolor = 9;  % Variable initialized with a random color

%touched = brick.TouchPressed(3);

while 1
   pause(0.1)
      
   color = brick.ColorCode(4);
   
   
   if color == 2     % Blue - Pick up passenger
       brick.StopMotor('AD');
       disp("Blue Detected");
   elseif color == 4   % Yellow - Drop off passenger
       brick.StopMotor('AD');
       disp("Yellow Detected");
   elseif color == 3   % Green - Start the vehicle
       brick.MoveMotor('AD', -50); 
       disp("Green Detected");
   elseif color == 5 && lastcolor ~= 5   % Detects red for first time - Pause the vehicle for 4 seconds
       disp("Red Detected")
       brick.StopMotor('AD');
       pause(3);    % Pauses for 4 seconds
       brick.MoveMotor('AD', -50);
   else
       %disp("Unknown Color");
   end
    
   lastcolor = color;
   
   % Manual control
   switch key
       case 'uparrow'  % Start the vehicle
           brick.MoveMotor('AD', -50)
       case 'downarrow'    % Stop the vehicle
           brick.MoveMotor('AD',50)
       case 'rightarrow'  % Turn right
           brick.StopAllMotors();
           brick.MoveMotor('D', 50);
           pause(1.2);
           brick.StopAllMotors();
       case 'leftarrow'   % Turn left
           brick.StopAllMotors();
           brick.MoveMotor('A', 50);
           pause(1.2);
           brick.StopAllMotors();
       case 'w'      %move claw up
           brick.MoveMotor('B',10);
       case 's'       %move claw down
            brick.MoveMotor('B',-10);
       case 'a'        %stop claw
           brick.StopAllMotors();
   end
   
   end