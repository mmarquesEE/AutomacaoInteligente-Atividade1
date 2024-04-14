function plotWheelVelocity(wR,wL,time)
persistent ax l1 l2;

if isempty(ax) || ~isvalid(ax)
    ax = axes(figure(3));

    title(ax,'Velocidade das rodas',FontName='Times');
    xlabel(ax, '$t(s)$',Interpreter='latex'); grid(ax,'on');
    ylabel(ax, '$\dot{\phi}(rad/s)$','Interpreter','latex'); 
    l1 = animatedline(ax,Color='b');
    l2 = animatedline(ax,Color='r');
    legend([l1,l2],{'$\dot{\phi_R}$','$\dot{\phi_L}$'},...
        'Interpreter','latex',Location='southeast');
end

addpoints(l1,time,wR);
addpoints(l2,time,wL);
drawnow limitrate;

