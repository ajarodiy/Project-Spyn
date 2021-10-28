%brick = ConnectBrick('ROBOT');

global key
InitKeyboard();

% brick.beep(); 
% brick.SetColorMode(4, 2);
% 
% lastcolor = 9  % Variable initialized with a random color
% 
% 
while 1
    pause(0.1)
      % Manual control
   switch key
       case 'uparrow'  % Start the vehicle
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
       case 'w'      %move crane upwards
           brick.MoveMotor('B', 20);
       case 's'      %move crane downwards
          brick.MoveMotor('B', -20);
       case '1'
           brick.StopAllMotors();

   end
end
% 
%    %color = brick.ColorCode(4);
% 
% 
%    %if color == 2     % Blue - Pick up passenger
%        %brick.StopMotor('AD');
%        %disp("Blue Detected");
%    %elseif color == 4   % Yellow - Drop off passenger
%        %brick.StopMotor('AD');
%       % disp("Yellow Detected");
%    %elseif color == 3   % Green - Start the vehicle
%       % brick.MoveMotor('AD', -50); 
%       % disp("Green Detected");
%    %elseif color == 5 && lastcolor ~= 5   % Detects red for first time - Pause the vehicle for 4 seconds
%       % disp("Red Detected")
%        %brick.StopMotor('AD');
%        %pause(4);    % Pauses for 4 seconds
%        %brick.MoveMotor('AD', -50);
%    %else
%        %disp("Unknown Color");
%    %end
% 
%    %lastcolor = color;

 

%    reading = brick.TouchPressed('C');
% 
%    if reading == true
%        brick.StopAllMotors();
%        brick.MoveMotor('AD', -20);
%        pause(0.1);
%        brick.MoveMotor('D', 20);
% 
%    end
% 
%    distance = brick.UltrasonicDist(1);
%    if distance > 30
%        brick.MoveMotor("A", 50);
%    end
% end
% 
%  
% 
% %    %Distance sensor
% %    %distance = brick.UltrasonicDist(1); 
% %    %if distance < 30  % Wall detected
% %        brick.StopAllMotors();
% %        brick.MoveMotor('D', 50);
% %        pause(1.1);
% %        brick.StopAllMotors();
% %        pause(0.5)
% % 
% %        %distance = brick.UltrasonicDist(1);
% % 
% %        %if distance < 30  % Another wall detected
% %            brick.StopAllMotors()
% %            brick.StopAllMotors();
% %            brick.MoveMotor('D', 50);
% %            pause(1.1);
% %            brick.StopAllMotors();
% %            brick.MoveMotor('D', 50);
% %            pause(1.1);
% %            brick.StopAllMotors();
% % 
% %            pause(0.5)
% %            brick.MoveMotor('AD', -50)
% % 
% %            %distance = brick.UltrasonicDist(1);  % Third wall detected
% %                %if distance < 30
% %                    %Rotate to the right
% %                    %Move forward
% %               % end
% %        %
% %            %brick.MoveMotor('AD', -50)
% %       % end
% %    %end
% % 
% % 
%    
% % 
% 
% 
% %end
% 
% CloseKeyboard();