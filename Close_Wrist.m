
motor_wrist.Speed = 10;  % CW rotation
pause(1)
motor_wrist.Speed = 0;
motor_wrist.resetRotation()
pause(0.2)