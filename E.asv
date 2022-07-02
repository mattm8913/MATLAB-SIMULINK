m1=1;
m2=1;
k1=10;
k2=10;
k3=10;
F1=1;
F2=0;
x0=[0;0;0;0];
A=[0,1,0,0;-(k1+k2)/m1,0,k2/m1,0;0,0,0,1;k2/m2,0,-(k2+k3)/m2,0];
B=[0,0;1/m1,0;0,0;0,1/m2];
C=[1,0,0,0;0,0,1,0];
D=[0,0;0,0];

st=['F1= ',num2str(F1),'  F2= ',num2str(F2),'  z1(0)= ',num2str(x0(1)),'  z2(0)= ',num2str(x0(3))];
figure(1) 
sim('M');
plot(t,Y1(:,1),'b',t,Y1(:,2),'r',t,Y2(:,1),'bd',t,Y2(:,2),'rd');
legend('z1 SS','z2 SS','z1 FB','z2 FB');
title(st);
xlabel('Time (s)');

F1=0;
F2=0;
x0=[1;0;0;0];
st2=['F1= ',num2str(F1),'  F2= ',num2str(F2),'  z1(0)= ',num2str(x0(1)),'  z2(0)= ',num2str(x0(3))];
figure(2);
sim('M');
plot(t,Y1(:,1),'b',t,Y1(:,2),'r',t,Y2(:,1),'bd',t,Y2(:,2),'rd');
legend('z1 SS','z2 SS','z1 FB','z2 FB');
title(st2);
xlabel('Time (s)');

F1=0;
F2=0;
x0=[1;0;1;0];
st3=['F1= ',num2str(F1),'  F2= ',num2str(F2),'  z1(0)= ',num2str(x0(1)),'  z2(0)= ',num2str(x0(3))];
figure(3);
sim('M2');
plot(t,Y3(:,1),'b',t,Y3(:,2),'r',t,Y4(:,1),'bd',t,Y4(:,2),'rd');
legend('z1 SS','z2 SS','z1 FB','z2 FB');
title(st3);
xlabel('Time (s)');

F1=0;
F2=0;
x0=[1;0;-1;0];
st4=['F1= ',num2str(F1),'  F2= ',num2str(F2),'  z1(0)= ',num2str(x0(1)),'  z2(0)= ',num2str(x0(3))];
figure(4);
sim('M3');
plot(t,Y5(:,1),'b',t,Y5(:,2),'r',t,Y6(:,1),'bd',t,Y6(:,2),'rd');
legend('z1 SS','z2 SS','z1 FB','z2 FB');
title(st4);
xlabel('Time (s)');

super=Y3+Y5;
figure(5);
plot(t,Y1(:,1),'b',t,Y1(:,2),'r',t,0.5.*super(:,1),'bd',t,0.5.*super(:,2),'rd');
legend('run1 z1','run1 z2','run2+run3 z1','run2+run3 z2');
title('Comparison of run1 with addition of runs 1&2');
xlabel('Time(s)');
ylabel('Position');











