
% This script takes the ball from station B (home configuration), place it at station
% C and then return to home

% MOVING motor_base to STATION B
desiredBaseValue = -320;
run("Base_Motor_PID.m");

%_________________________________________________________________________

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

%______________________________________________________________________________________________
% close the wrist
run("Close_Wrist.m")

%___________________________________________________________________________________________

%%% AT THIS STAGE, THE BALL HAS ALREADY BEEN PICKED UP
%______________________________________________________________________________________________

% Moving elbow up
desiredElbowValue = 0;
run("Elbow_Motor_PID.m");

%_______________________________________________________________________________________

% Moving motor_base to station C
desiredBaseValue = -590;
run("Base_Motor_PID.m");
%________________________________________________________________________________________

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


%_________________________________________________________________________________________

% Moving motor_elbow up after dropping the ball
desiredElbowValue = 0;
run("Elbow_Motor_PID.m");

%_______________________________________________________________________________________

% MOVING motor_base BACK TO THE HOME CONFIGURATION
desiredBaseValue = -320;
run("Base_Motor_PID.m");




