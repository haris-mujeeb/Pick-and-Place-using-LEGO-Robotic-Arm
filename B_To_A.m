
% This script takes the ball from station B (home configuration), place it at station
% A and then return to home

% MOVING motor_base TO STATION B

desiredBaseValue = -320;
run("Base_Motor_PID.m");

%_________________________________________________________________________

% opening the wrist
run("Open_Wrist.m")


%________________________________________________________________________________________________________

% Moving motor_elbow down to the drop area

station_height = readDistance(ultrasonic_sensor);
Z_desired = station_height - 0.03;
angle =  rad2deg(atan(Z_desired/0.1));
real_angle = angle*5;

desiredElbowValue = real_angle;
run("Elbow_Motor_PID.m");

%______________________________________________________________________________________________

% close the wrist
run("Close_Wrist.m")

%___________________________________________________________________________________________

%%% AT THIS STAGE, THE BALL HAS ALREADY BEEN PICKED UP
%______________________________________________________________________________________________

% Moving motor_elbow up after closing the grabbing the ball
desiredElbowValue = 0;
run("Elbow_Motor_PID.m");

%___________________________________________________________________________________________
% Moving motor_base to station A
desiredBaseValue = 0;
run("Base_Motor_PID.m");

%___________________________________________________________________________________________
% Moving motor_elbow down to the drop area

resetRotation(motor_elbow);
station_height = readDistance(ultrasonic_sensor);
Z_desired = station_height - 0.03;
angle =  rad2deg(atan(Z_desired/0.1));
real_angle = angle*5;

desiredElbowValue = real_angle;
run("Elbow_Motor_PID.m");

%______________________________________________________________________________________
% opening the wrist (motor_wrist) to drop the ball
run("Open_Wrist.m")


%_________________________________________________________________________________________

% Moving motor_elbow up after dropping the ball
desiredElbowValue = 0;
run("Elbow_Motor_PID.m");

%________________________________________________________________________________________

% MOVING motor_base BACK TO STATION B

desiredBaseValue = -320;
run("Base_Motor_PID.m");


