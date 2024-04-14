close all
clear all
clc

%% Parâmetros do PioneerP3DX (SI)
D = 195e-3;     % Diâmetro das rodas
R = D/2;        % Raio das rodas
d = 44.51e-3;   % Distância do centro de massa ao eixo das rodas
L = 0.1655;     % Largura do robô / 2
mc = 13;        % Massa do chassi
mw = 1.5;       % Massa da roda + motor
m = mc + 2*mw;  % Massa total do robô
Ic = 130.7e-3;  % Momento de inércia do chassi
Iw = 40e-3;     % Momento de inércia da roda em torno do eixo
Im = 20e-3;     % Momento de inércia da roda em torno do diâmetro
I = Ic + mc*d^2 + 2*mw*L^2 + 2*Im; % Inércia total
Ra = 710e-3;    % Resistência de armadura do motor
La = 0.66e-3;   % Indutância da armadura
Vs = 12;        % Tensão máxima de armadura
Kb = 23e-3;     % Constante de força eletromotriz
Kt = 29e-3;     % Constante de torque
N = 38.3;       % Razão da caixa de redução

%% Simulação do modelo
open_system('model');
sim('model');

%% Salvar Imagens
imgName = {'Trajectory','Velocity','WheelVelocity','Input'};
for i = 1:4
    saveas(figure(i),['Images/',imgName{i},'.png']);
end
