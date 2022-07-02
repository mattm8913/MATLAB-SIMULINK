plot(tout,z2_prime,'r');
hold on
plot(tout_lin,z2_prime_lin,'b');
grid on
legend('Nonlinear Jump Speed','Linear Jump Speed');
title('Speed vs Time');
xlabel('Time (sec)');
ylabel('Speed (m/s)');