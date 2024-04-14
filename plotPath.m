function plotPath(xSim,ySim,xCop,yCop)
persistent ax l1 l2;

if isempty(ax) || ~isvalid(ax)
    ax = figure(1).CurrentAxes;
    if isempty(ax)
        ax = axes(figure(1));
    end
    
    axis(ax,'equal'); grid(ax,'on'); hold(ax,'on');
    title(ax,'Trajetória',FontName='Times');
    xlabel(ax,'$x(m)$',Interpreter='latex');
    ylabel(ax,'$y(m)$',Interpreter='latex');
    
    l1 = animatedline(ax,Color='b',LineStyle='--');
    l2 = animatedline(ax,Color='r',LineStyle='--');
    legend([l1,l2],{'Simulink','CoppeliaSim'},...
        'AutoUpdate','off',Location='southeast',Interpreter='latex');
end

addpoints(l1,xSim,ySim);
addpoints(l2,xCop,yCop);
drawnow limitrate;