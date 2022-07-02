subplot(4,1,1)
plot(Vs_kts,ship_drag);
xlabel('Ship Speed (kts)');
ylabel('Force (lbf)');
title('Force vs Speed');
grid on
subplot(4,1,2)
plot(Rem,Ctm,'b');
hold on
plot(Rem,Cfm,'r');
plot(Rem,Crm,'g');
xlabel('Rn Model');
ylabel('Drag Coefficients');
title('Model Drag Coefficients');
legend('Ct','Cf','Cr');
grid on
subplot(4,1,3)
plot(Res,Cts,'b');
hold on
plot(Res,Cfs,'r');
plot(Res,Crs,'g');
xlabel('Rn Ship');
ylabel('Drag Coefficients');
title('Ship Drag Coefficients');
legend('Ct','Cf','Cr');
grid on
subplot(4,1,4)
plot(Vs_kts,hp);
xlabel('Ship Speed (kts)');
ylabel('EHP');
title('Horse Power vs Speed');
grid on