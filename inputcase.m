%In line script for input variables according to case study chosen
%1    Lossless with matched Rl, Rs
%2   Lossless with open circuit
%0    Lossless with short circuit
%3    Lossless with missmatched Rl and Rs
%4    Lossless with clfn=0.99 and missmatched Rl, Rs
%5    Lossy with missmatched Rl and Rs
%6    Lossless with missmatched Rs, and parallel RC load
%7    Lossless with missmatched Rs, and series RL load

dx=0.01; d=0.5;
ncells=d/dx;
C= 100e-12; L=250e-9; 
vp=1/sqrt(L*C); 
zo= sqrt(L/C); 

% Input Variables
case_study=input("Choose a case number between 0-7 \nCase study= ");


if case_study==1
  
   clfn=1;
   simtime=5e-9;
   dt=clfn*dx/vp;
   nx=ncells+1; 
   nt=floor(simtime/dt);
   G=0; R=0;
   Rs=50; Rl=50;
   loadtype=1;
   timesnaps=[0,1.25e-9,2.5e-9,3e-9,5e-9];
   numsnaps=5;

elseif case_study==0
    
    clfn=1;
    simtime=5e-9;
    dt=clfn*dx/vp;
    C= 100e-12; L=250e-9;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=0; R=0;
    simtime=5e-9;
    Rs=50; Rl=1e-30;  % short circuit intepreted as very small 
    loadtype= 0;
    timesnaps=[2.5e-9, 3e-9, 5e-9];
    numsnaps=3;

elseif case_study==2
   
    clfn=1;
    simtime=5e-9; 
    dt=clfn*dx/vp;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=0; R=0;
    Rs=50; Rl=5e30; % open circuit interpreted as very large
    loadtype=-1;
    timesnaps=[2.5e-9, 3e-9, 5e-9];
    numsnaps=3;

elseif case_study==3
    
    clfn=1;
    simtime=10e-9; 
    dt=clfn*dx/vp;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=0; R=0;
    simtime=10e-9; 
    Rs=25; Rl=150;
    loadtype=1;
    timesnaps=[2.5e-9, 3e-9, 5e-9, 7.5e-9, 10e-9];
    numsnaps=5;

elseif case_study==4
   
    clfn=0.99;
    simtime=10e-9; 
    dt=clfn*dx/vp;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=0; R=0;
    simtime=10e-9; 
    Rs=25; Rl=150;
    loadtype=1;
   timesnaps=[2.5e-9, 3e-9, 5e-9, 7.5e-9, 10e-9];
   numsnaps=5;

elseif case_study==5
    
    clfn=1;
    simtime=10e-9; 
    dt=clfn*dx/vp;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=25e-3; R=50e-3;
    Rs=25; Rl=150;
    loadtype=1;
    timesnaps=[2.5e-9,3e-9, 5e-9, 7.5e-9, 10e-9];
    numsnaps=5;
   
elseif case_study==6
    
    clfn=1;
    simtime=5e-9; 
    dt=clfn*dx/vp;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=0; R=0;
    Rs=50; Rl=150; Cl=5e-12;
    loadtype=2;
    timesnaps= [2.5e-9, 3e-9, 5e-9];
    numsnaps=3;

    
elseif case_study==7
   
    IL=0;
    clfn=1;
    simtime=5e-9;
    dt=clfn*dx/vp;
    nx=ncells+1; 
    nt=floor(simtime/dt);
    G=0;R=0;
    Rs=50; Rl=10; Ll=10e-9;
    loadtype=3;
    timesnaps= [2.5e-9, 3e-9, 5e-9];
    numsnaps=3;

end


    











