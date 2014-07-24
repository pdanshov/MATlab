E=0:20:100;
R1=50; R2=100; R3=150;
I1=E/R1; I2=E/R2; I3=E/R3; I4=[.0 .09 .23 .28 .41 .52];
plot(E,I1,'k:*',E,I2,'b-+',E,I3,'r--o',E,I4,'g-.P');
xlabel('E(Volts)');
ylabel('I(Amps)');
title('PROJ12 OHMS LAW PLOT for 4Rs on 1 set of axes');
legend('R1','R2','R3','R4',0);
grid