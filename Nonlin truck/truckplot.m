%Plot
figure(1)
plot(t,z2,'r')
hold on
plot(t,z2lin,'b')
plot(t,z1lin,'g')
legend('Nonlinear','Linear','Step')
grid on
title('Linear and Nonlinear Resposne to Step Input')
xlabel('Time (sec)')
ylabel('Position (ft)')
