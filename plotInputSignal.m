function plotInputSignal(VaR,VaL,time)
persistent ax l1 l2;

if isempty(ax) || ~isvalid(ax)
    ax = axes(figure(4));

    title(ax,'Tensão no motor',FontName='Times');
    xlabel(ax, '$t(s)$',Interpreter='latex');
    ylabel(ax, '$V_a(V)$',Interpreter='latex'); 
    grid(ax,'on');

    l1 = animatedline(ax,Color='b');
    l2 = animatedline(ax,Color='r');
    legend([l1,l2],{'$V_{aR}$','$V_{aL}$'},...
        'Interpreter','latex',Location='southeast');
end

addpoints(l1,time,VaR);
addpoints(l2,time,VaL);
drawnow limitrate;