%Arm Plot

figure(3)
hold on
plot(plot_time,-arminterface_armPosition,'r');
hold on
plot(tout,simout(:,2),'b');
grid on
legend('Data','Model');
Title('Arm Position');
ylabel('Radians');
xlabel('Time');