clear 
clc

ic=2;
sim('project_2');
figure(1);
plot(tout,output);

ic=3;
sim('project_2');
figure(2);
plot(tout,output);

ic=6;
sim('project_2');
figure(3);
plot(tout,output);