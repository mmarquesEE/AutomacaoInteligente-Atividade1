function plotVelocity(vSim,wSim,vCop,wCop,time)
persistent ax1 ax2 l1 l2 l3 l4;

if isempty(ax1) || ~isvalid(ax1)
    ax1 = axes(figure(2));
    ax2 = axes(figure(2));

    subplot(2,1,1,ax1); title(ax1,'Velocidade Linear',FontName='Times');
    xlabel(ax1, '$t(s)$',Interpreter='latex');
    ylabel(ax1, '$\nu(m/s)$',Interpreter='latex');
    grid(ax1,'on');
    l1 = animatedline(ax1,Color='b');
    l2 = animatedline(ax1,Color='r');

    subplot(2,1,2,ax2); title(ax2,'Velocidade Angular',FontName='Times');
    xlabel(ax2, '$t(s)$',Interpreter='latex');
    ylabel(ax2, '$\omega(rad/s)$',Interpreter='latex');
    grid(ax2,'on');
    l3 = animatedline(ax2,Color='b');
    l4 = animatedline(ax2,Color='r');

    legend([l3,l4],{'Simulink','CoppeliaSim'},...
        Location='south',Orientation='vertical',Interpreter='latex');
end

addpoints(l1,time,vSim);
addpoints(l2,time,vCop);
addpoints(l3,time,wSim);
addpoints(l4,time,wCop);
drawnow limitrate;