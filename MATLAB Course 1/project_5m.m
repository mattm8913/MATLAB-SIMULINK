%% Load Data
Data = xlsread('Battery_Parameters.xlsx');

%% Name Data (hit CTRL+ENTER to run only the current cell
SOC = Data(:,1);
OCV = Data(:,2);
R_Charge = Data(:,3);
R_Discharge = Data(:,4);

%% Plot
plot(SOC, OCV)
figure
plot(SOC, R_Charge)
figure
plot(SOC, R_Discharge)

%% Define Param
I = 2.3;  % current
Cn = 2.3 * 3600; % capacity in Amp-seconds
Sim_Time = 3600; % sim trun time in seconds

%%
sim('project_5');
