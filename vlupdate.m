% In line script for load voltage updates with respective coefficients
% Different cases studies will generate different load voltages updates
% Notice that for lossless cases simply G and R equal 0
% (-1)=open circuit
% (0)= short circuit
% (1)= resistive loads
% (2)= parallel RC load
% (3)= series RL load
%Coefficientes are represented as cvl1 and cvl2

if loadtype==-1
    cvl1= (C/dt-G/2)/(C/dt+G/2);
    cvl2= 1/(C/dt+G/2)/dx;
    V(nx)= cvl1*V(nx)+cvl2*I(nx-1);

elseif loadtype==0
    V(nx)=0;

elseif loadtype==1
    cvl1=(C*0.5*dx/dt-0.5/Rl-0.25*G*dx);
    cvl2=1/(C*0.5*dx/dt+0.5/Rl+0.25*G);  %%
    V(nx)= cvl2*(cvl1*V(nx)+I(nx-1));

elseif loadtype==2
    cvl1= (C*0.5*dx/dt+Cl/dt-0.5/Rl);
    cvl2= 1/(C*0.5*dx/dt+Cl/dt+0.5/Rl);
    V(nx)= cvl2*(cvl1*V(nx)+I(nx-1));

elseif loadtype==3
  
    P = [(C*0.5*dx/dt), (0.5); (0.5), (-(Ll/dt+Rl*0.5))];
    Q = [(C*0.5*dx/dt),(-0.5); (-0.5),(-(Ll/dt-Rl*0.5))];
    pinv = inv(P);

    X= [V(nx);IL];
    Y =[I(nx-1);0];
    X=pinv*(Q*X+Y);
    V(nx)=X(1);
    IL=X(2);
    
end

