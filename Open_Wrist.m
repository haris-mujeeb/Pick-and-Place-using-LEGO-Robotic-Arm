% opening the wrist (motor_wrist)

motor_wrist.Speed = 10;  % CW rotation
pause(1)
motor_wrist.Speed = 0;
motor_wrist.resetRotation()

while motor_wrist.readRotation() >= -85
    motor_wrist.Speed = -10;     % CCW rotation
    motor_wrist.readRotation();
end
motor_wrist.Speed = 0;
pause(0.2)
