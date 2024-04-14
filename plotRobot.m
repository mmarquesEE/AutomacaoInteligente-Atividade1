function plotRobot(xSim,ySim,thetaSim,xCop,yCop,thetaCop)
persistent ax;

if isempty(ax) || ~isvalid(ax)
    ax = figure(1).CurrentAxes;
    if isempty(ax)
        ax = axes(figure(1));
    end
    axis(ax,'equal'); grid(ax,'on'); hold(ax,'on');
end
r = polyshape([-0.1 -0.1 0.2],[-0.1 0.1 0]);
r1 = translate(rotate(r,(180/pi)*thetaSim),[xSim, ySim]);
r2 = translate(rotate(r,(180/pi)*thetaCop),[xCop, yCop]);

plot(ax,r1,FaceColor='b');
plot(ax,r2,FaceColor='r');