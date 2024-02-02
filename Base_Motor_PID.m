clc
% PID Controller
Kp = 0.28  ;  % proportional gain -- 2.2 
Ki = 0.008;     % integral gain -- 0.02
Kd = 0.08;     % derivative gain

sensorValue = motor_base.readRotation();
error = desiredBaseValue - sensorValue;
prev_error = error;
pause(1);

integral = 0;
continuePIDFlag = 1;
while continuePIDFlag
    % Integral
    integral = integral + error;

    % Derivative
    derivative = (error - prev_error);

    % Control signal
    control_signal = Kp * error + Ki * integral + Kd * derivative;
    motor_base.Speed = control_signal;
    
    % Error
    sensorValue = motor_base.readRotation();
    error = desiredBaseValue - sensorValue;
    prev_error = error;
    if abs(error) <= 5
        pause(0.1);
        sensorValue = motor_base.readRotation();
        error = desiredBaseValue - sensorValue
        prev_error = error;
        if abs(error) <= 5
            continuePIDFlag = 0;
        end
    end
end
motor_base.Speed = 0;
