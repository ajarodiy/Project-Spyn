function turnOneEighty(brick, pauseTime)
    brick.StopAllMotors();
    pause(1);
    brick.MoveMotor('A', 60);
    pause(pauseTime*2);
    brick.StopAllMotors();
    pause(0.5);
    brick.MoveMotor('AD', -50);
end