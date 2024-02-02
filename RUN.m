clc
clear 
myev3 = legoev3('USB');
beep(myev3)

% connecting to the motors
motor_base = motor(myev3, 'C');
motor_elbow = motor(myev3, 'B');
motor_wrist = motor(myev3, 'A');

% connecting to the touch sensors 
base_sensor = touchSensor(myev3, 1);
elbow_sensor = touchSensor(myev3, 3);

% connecting to the ultrasonic sensor
ultrasonic_sensor = sonicSensor(myev3, 2);

run("Homing.m")
run("C_To_B.m")
run("B_To_A.m")
run("A_To_B.m")
run("B_To_C.m")
run("C_To_A.m")
run("A_To_C.m")