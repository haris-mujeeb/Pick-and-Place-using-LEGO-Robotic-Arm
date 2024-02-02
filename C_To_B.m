% This script takes the ball from station B, place it at station B and then
% return to home configuration at station B

% MOVING motor_base to STATION B
desiredBaseValue = -320;
run("Base_Motor_PID.m");

% ______________________________________________________________________________________
% Moving motor_base to station C
desiredBaseValue = -590;
run("Base_Motor_PID.m");

%________________________________________________________________________________________
% opening the wrist (motor_wrist)
run("Open_Wrist.m")

%________________________________________________________________________________________________________
% Moving motor_elbow down to the ball
resetRotation(motor_elbow);
station_height = readDistance(ultrasonic_sensor);
Z_desired = station_height - 0.03;
angle =  rad2deg(atan(Z_desired/0.1));
real_angle = angle*5;
desiredElbowValue = real_angle;
run("Elbow_Motor_PID.m");

%_______________________________________________________________________
% close the wrist
run("Close_Wrist.m")

%___________________________________________________________________________________________

%%% AT THIS STAGE, THE BALL HAS ALREADY BEEN PICKED UP
%______________________________________________________________________________________________


% Moving motor_elbow up
desiredElbowValue = 0;
run("Elbow_Motor_PID.m");

%_______________________________________________________________________________________

% MOVING motor_base BACK TO STATION B
desiredBaseValue = -320;
run("Base_Motor_PID.m");

%_______________________________________________________________________________________
% Moving motor_elbow down to the drop area
resetRotation(motor_elbow);
station_height = readDistance(ultrasonic_sensor);
Z_desired = station_height - 0.03;
angle =  rad2deg(atan(Z_desired/0.1));
real_angle = angle*5;
desiredElbowValue = real_angle;
run("Elbow_Motor_PID.m");

%__________________________________________________________________________________________________
% opening the wrist (motor_wrist) to drop the ball
run("Open_Wrist.m")

%_______________________________________________________________________________________
% Moving motor_elbow up after dropping the ball
desiredElbowValue = 0;
run("Elbow_Motor_PID.m");

%_______________________________________________________________________________________

% THE ROBOT SHOULD BE AT ITS HOME CONFIGURATION NOW


