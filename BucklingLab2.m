%Kyle Mitra - EGR 201 - Boadu
Length = [1.518; 2.015; 3.992; 5.996];
Width = [0.5; 0.4971; 0.5; 0.5];
Thickness= [0.124; 0.124; 0.123; 0.125];
FailLoad = [1425; 1491.5; 492.7; 205.7];
PlasticDeformation = [46e-5; 12e-5; 68e-6; 20e-5];

ITheo = (1./12).*(0.5).*(0.125).^3;
IExp = (1./12).*(Width).*(Thickness).^3;
Area = (0.125).*(0.5);
AreaExp = Width.*Thickness;
RTheo = sqrt(ITheo./Area);
RExp = sqrt(IExp./AreaExp);
E = 10e6;
L = linspace(0,10,1000);
Slenderness = L./RTheo;
Slenderness2 = Length./RTheo;
Slenderness3 = Length./RExp;
Load = ((pi.^2).*(E).*(ITheo))./(L.^2);
YieldLoad = (37e3).*Area;
Load2 = ((pi.^2).*(E).*(ITheo))./(Length.^2)
Error = ((Load-Load2)./Load2).*100;

figure(1);clf
plot(Slenderness,Load,'k')
hold on
plot([-100 10000],[1 1].*YieldLoad,'b')
plot(Slenderness2,Load2,'.r')
plot(Slenderness3,FailLoad,'sb')
axis([0 250 0 4000])
xlabel('Slenderness Ratio')
ylabel('Applied Load (lbs)')
title('Load vs. Slenderness Ratio (km423)')
legend('Predictive Curve','Compressive Yielding', 'Predicted Critical Loads', 'Observed Critical Loads','location','best') 