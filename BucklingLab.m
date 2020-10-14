L = [1.518; 2.015; 3.992; 5.996];
W = [0.5; 0.4971; 0.5; 0.5];
T = [0.124; 0.124; 0.123; 0.125];
FailEXP = [1425; 1491.5; 492.7; 205.7];
PlasticDeformation = [46e-5; 12e-5; 68e-6; 20e-5];

ATheo = (0.5).*(0.125);
AExp = W.*T;
ITheo = (1./12).*(0.5).*(0.125).^3;
IExp = (1./12).*(W).*(T).^3;
E = (10e6); %Different VALUE
RTheo = sqrt(ITheo./ATheo);
RExp = sqrt(IExp/A);

linL = linspace(0,10,1000);

SlendernessRatioTheo= (linL)./RTheo;
SlendernessRatioExp = (L)./RTheo;
SlendernessRatio3 = (L)./RExp;
P = ((pi).^2.*E.*ITheo)./(linL.^2);
P2 = ((pi).^2.*E.*ITheo)/(L.^2);
YieldLoad = (37e3)*ATheo;
Error = ((FailEXP-P2)./P2).*100;
Comp = (37000).*100;

figure(1);clf
plot(SlendernessRatioTheo,P,'k')
hold on
plot([-100 10000], [1 1].*YieldLoad,'b')
plot(SlendernessRatioExp, P2, '.r')
plot(SlendernessRatio3,FailEXP,'sb')
axis([0 250 0 4000])
ylabel('Applied Load (lbs)')
xlabel('Slenderness Ratio')
title('Load vs. Slenderness Ratio (km423)')
legend('Predictive Curve', 'Compressive Yielding', 'Predicted Critical Loads', 'Observed Critical Loads', 'location', 'best')
