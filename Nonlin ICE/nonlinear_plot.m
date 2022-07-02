plot(tout,z2,'r');
hold on
plot(tout,z1,'b');
grid on
plot(tout_lin,z2_lin,'g');
plot(tout_lin,z1_lin,'c');
legend('Nonlinear z2','Nonlinear z1','Linear z2','Linear z1');
title('Linear and Nonlinear Models');
xlabel('Time (sec)');
ylabel('Position (m)');