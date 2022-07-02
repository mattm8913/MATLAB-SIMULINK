%% first sim
Sim_Time = 0.6;
Step_Final = 1;
m=1;
b=10;
k=20;

%% Define PID controller parameters
Kp = 1000;
Ki = 0;
Kd = 0;
sim('project_8');
figure(1)
plot(time, in)
hold all
plot(time,output)


%% PID Controller
Kp = 4433;
Ki = 7398;
Kd = 207.6;
N = 2.384e4;
sim('project_8');

%% Plotting
figure(1)
plot(time, in)
hold all
plot(time,output)
