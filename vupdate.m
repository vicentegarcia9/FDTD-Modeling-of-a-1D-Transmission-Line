% In line script for in line voltage updates

%Coefficients represented as cv1 and cv2
cv1 = (C/dt-G/2)/(C/dt+G/2);
cv2 = 1/(C/dt+G/2)/dx;

% Update equation
 V(2:nx-1)= cv1*V(2:nx-1)-cv2*(I(2:nx-1)-I(1:nx-2));


  