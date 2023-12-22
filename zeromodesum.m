clc
clear
syms x
syms yy
k=(-20:1:20);
L=100;
e=0.001;
S=power(k,2);
S1=power(2*e*L,1/2);
SS=(S*L)/(2*e)+1;
SSP=power(SS,-3/2);
SSPP=(1)/(4*S1)*SSP;
Integrand=(L*SSPP)/(2*pi);
sumzero = vpasum((1)/(4*(power(2*e*L,1/2)))*(power((((power(x,2))*L)/(2*e)+1),-3/2)),x,-inf,inf);
Syy = @(yy) (L)/(4*2*pi*(power(2*e*L,1/2)))*(power((((power(yy,2))*L)/(2*e)+1),-3/2));
Integralzero = integral(Syy,-inf,inf);
%1st plot
subplot(1,2,1);
bar(k, SSPP,0.7,'blue');
ylim([0 0.00000001])
title('Histogram of Summation Expression')
subtitle('finite interval of momentum')
s = sprintf('Summation = %.4f i',sumzero);
text(-19,0.0000000085,s);
s = sprintf('ϵ = %.4f',e);
text(-19,0.000000009,s);
s = sprintf('L = %.f',L);
text(-19,0.0000000095,s);
xlabel('$k^+$','Interpreter','Latex')
ylabel('$\frac{i}{4\sqrt{2\epsilon L}}\left[\frac{L(k^{+})^2}{2\epsilon}+m^2\right]^{-\frac{3}{2}}$','Interpreter','Latex')
%2nd plot
subplot(1,2,2);
area(k, Integrand,'FaceColor','b');
ylim([0 0.00000001])
title('Plot of Integrand')
subtitle('Continuum Limit')
s = sprintf('     Integral = %.4f i',Integralzero);
text(-19,0.0000000085,s);
s = sprintf('     ϵ = %.4f',e);
text(-19,0.000000009,s);
s = sprintf('     L = %.f',L);
text(-19,0.0000000095,s);
xlabel('$k^+$','Interpreter','Latex')
ylabel('$\frac{iL}{4\sqrt{2\epsilon L}}\frac{1}{2\pi}\left[\frac{L(k^{+})^2}{2\epsilon}+m^2\right]^{-\frac{3}{2}}$','Interpreter','Latex')
