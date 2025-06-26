clc, close all, clear all;

%Input program control based on chosen case study 
inputcase;

%Initialization of data arrays
V= zeros(nx,1); I=zeros(nx-1,1);
x=linspace(0,d,nx);

k1=plot(x,V,'Linewidth', 2);
grid on
ylim([-2 3])
ylabel('Voltage (V)')
xlabel('x(m)')
title('Voltage vs Distance')

%Data initialization for snapshots
nsnap = floor(timesnaps/dt)+1;
Vsnap=zeros(nx,numsnaps);
ksnap=1;


for n = 1:nt     
     
      vupdate; % update in line voltages
      vsupdate; % update source voltages
      vlupdate; % update load voltages
      iupdate; % update the line currents
         
       set(k1,'Ydata',V);
       drawnow;
       pause(0.05);
        
      % output the probe voltages and currents:
      output;
 
end


% plot the voltage snapshots:
for ksnap = 1:numsnaps

    if(ksnap == 1)

        figure();
   end

    % plot the graph of this time stamp in the figure
   plot(x,Vsnap(:,ksnap),'LineWidth',1);
   grid on
   title('Voltage vs Distance')

    % This stores the time of the snap shot by converting the number to
    % string, and concatinating with the unts of nanoseconds

    legendtext{ksnap} = strcat(num2str(timesnaps(ksnap)*1e9),'ns');

    hold on;

end

%Label the x and y axes. 
xlabel('x (m)');
ylabel('Voltage (V)');

% Set the limits of the x bounds and y-bounds
axis([0 d -2.0 2.0]);

% This creates a legend using the cell array of strings
legend(legendtext,'Location','best');

% set the font size, so the plot is readable in a report
set(gca,'FontSize',10)






