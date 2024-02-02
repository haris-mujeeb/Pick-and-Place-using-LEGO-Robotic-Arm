% % Moving motor_elbow to home configuration

if readTouch(elbow_sensor) == 0
    while readTouch(elbow_sensor) == 0
        motor_elbow.Speed = -30;
    end
else 
    while readTouch(elbow_sensor) == 1
        motor_elbow.Speed = 30;
    end
end
motor_elbow.Speed = 0;
motor_elbow.resetRotation();

%_________________________________________

% MOVING motor_base TO THE HOME CONFIGURATION
while readTouch(base_sensor) == 0
        motor_base.Speed = 20;
end

while readTouch(base_sensor) == 1
    motor_base.Speed = -20;
end
motor_base.Speed = 0;
motor_base.resetRotation();

desiredBaseValue = -0;
run("Base_Motor_PID.m");
% AT THIS STAGE THE ARM IS AT THE HOME CONFIGURATION (STATION A)
