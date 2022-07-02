%% first sim
Sim_Time = 7;
Step_Value = 1;
m=1;
b=10;
k=20;

%% Define PID controller parameters
Kp = 200;
Ki = 0;
Kd = 0;
sim('project_7');
figure(1)
plot(time, in)
hold all
plot(time,output)


%% PID Controller
Kp = 350;
Ki = 300;
Kd = 50;
sim('project_7');

%% Plotting
figure(1)
plot(time, in)
hold all
plot(time,output)
