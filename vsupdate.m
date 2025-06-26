% In line script for source voltage updates
%Vs interpreted as the trapezoidal pulse signal
trise= 200e-12; 
tfall=trise;
tduration=500e-12;
Vamp=2;

Vs=0;
% Source time
t=(n-0.5)*dt;

if t <= 0
        Vs = 0;
    elseif t< trise
        Vs = Vamp*t/trise;
    elseif t< trise+tduration
        Vs = Vamp;
elseif t< trise+tfall+tduration
        Vs = Vamp*(trise+tfall+tduration-t)/tfall;
    else
    Vs= 0;

end 

%Vs coefficients
cvs2 = (1.0/(C*dx*0.5/dt+0.5/Rs+0.25*G*dx));
cvs1 = (C*dx*0.5/dt-0.5/Rs-0.25*G*dx)*cvs2;
cvs2= cvs2/Rs;

%Vs update
V(1)=cvs1*V(1)+cvs2*(Vs-Rs*I(1));







