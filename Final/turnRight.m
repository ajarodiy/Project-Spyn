function turnRight(brick, pauseTime)
    pause(0.5);
    brick.StopAllMotors();
    pause(1);
    brick.MoveMotor('A', -65);
    %brick.MoveMotor('D', -50);
    pause(pauseTime+0.2);
    brick.StopAllMotors();
    pause(0.5);
    brick.MoveMotor('AD', -50);
    pause(1.5);
    %brick.MoveMotor('AD', -50);
end
