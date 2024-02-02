% PID Controller
Kp = 0.15;  % proportional gain
Ki = 0.005;     % integral gain
Kd = 0;     % derivative gain

% desiredElbowValue = 50;
sensorValue = motor_elbow.readRotation();
desiredElbowValue = int32(desiredElbowValue);
error =  desiredElbowValue - sensorValue;
prev_error = error;

integral = 0;
continuePIDFlag = 1;
while continuePIDFlag
    % Integral
    integral = integral + error;

    % Derivative
    derivative = (error - prev_error);

    % Control signal
    control_signal = Kp * error + Ki * integral + Kd * derivative;
    motor_elbow.Speed = control_signal;
    
    % Error
    sensorValue = motor_elbow.readRotation();
    error = desiredElbowValue - sensorValue
    prev_error = error;
    if abs(error) <= 5
    %     pause(0.1);
    %     sensorValue = motor_elbow.readRotation();
    %     error = desiredElbowValue - sensorValue;
    %     prev_error = error;
    %     if abs(error) <= 5
            continuePIDFlag = 0;
    %     end
    end
end
motor_elbow.Speed = 0;