%Scope Plot
figure(1)
hold on
plot(plot_time,-arminterface_armPosition,'g');
hold on
plot(plot_time,-arminterface_motorPosition,'r');
grid on
legend('Arm','Motor');
Title('Position Data');
ylabel('Radians');
xlabel('Time');