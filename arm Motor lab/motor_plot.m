%Motor Plot

figure(4)
hold on
plot(plot_time,-arminterface_motorPosition,'r');
hold on
plot(tout,simout(:,1),'b');
grid on
legend('Data','Model');
Title('Motor Position');
ylabel('Radians');
xlabel('Time');