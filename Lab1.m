%Kyle Mitra - EGR 201 Tension Lab
Data = importdata('2019Mar04_1530_GroupB.txt');
Force = Data(:,1);
Displacement = Data(:,2);
Strain = Data(:,3);
diameter = 0.00638;
Area = pi*((diameter/2)^2);
Stress = Force/Area;

ymStrain = Strain(65:75);
ymStress = Stress(65:75);
LinReg = polyfit(ymStrain,ymStress,1);

OffsetStrain = Strain(31:218);

uStress = max(Stress);

figure(1);clf
plot(Strain,Stress,'-k')
title('Full Range of Stress vs Strain')
xlabel('Strain (%)')
ylabel('Stress (Pa)')

figure(2);clf
plot(ymStrain,ymStress,'-k')
xlim([0 0.2])
title('Linear Portion of Graph')
xlabel('Strain (%)')
ylabel('Stress (Pa)')

figure(3);clf
hold on
plot(Strain,Stress,'-r')
plot((OffsetStrain-0.002),((OffsetStrain-0.002)*(1.5032*1.0e9)),'b-')
hold off
xlim([0 0.5])
title('Calculation of Yield Stress')
xlabel('Strain (%)')
ylabel('Stress (Pa)')
%Intersection is 0.39933,1.91902e4
