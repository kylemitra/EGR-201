T = TorsionLabData{:,1};
S = TorsionLabData{:,2};

Tu = max(T)
figure(1);clf
plot(S,T)
xlabel('Shear Strain (radians)')
ylabel('Torque (Nm)')
title('Full range of strain')

T2 = T((1:39),1);
S2 = S((1:39),1);

figure(2);clf
plot(S2,T2)
xlabel('Shear Strain (radians)')
ylabel('Torque (Nm)')
title('Reduced range of strain')

%LinReg = polyfit(S2,T2,1)
Slope = T2./S2;
avgSlope = mean(Slope)

figure(3);clf
hold on
plot(S2,T2,'r-')
plot((S2-0.002),((S2-0.002)*4.0195e4),'b-')
hold off
xlim([0 0.01])
xlabel('Shear Strain (radians)')
ylabel('Torque (Nm)')
title('0.2% Offset Method')
%Intersection at 5.54744 radians, 222.97955 Nm
%Ty = 222.97955 Nm