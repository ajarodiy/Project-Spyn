function turnLeft(brick)
    brick.StopAllMotors();
    brick.MoveMotor('D', 50);
    pause(1.1);
    brick.StopAllMotors();
    pause(0.5)
    brick.MoveMotor('AD', -50)
end
