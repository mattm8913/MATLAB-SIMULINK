%Model Plot
figure(2)
plot(tout,simout)
grid on
legend('Motor','Arm');
Title('Model');
ylabel('Radians');
xlabel('Time');