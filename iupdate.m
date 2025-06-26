% In line script for in line current updates

%Coefficients represented as ci1 and ci2
ci1 = (L/dt-0.5*R)/(L/dt+R*0.5);
ci2 = 1.0/(L/dt+0.5*R)/dx;

%Update equation
I(1:nx-1) = ci1*I(1:nx-1)-ci2*(V(2:nx)-V(1:nx-1));