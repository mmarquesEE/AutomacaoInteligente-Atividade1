function coppeliaClient(block)

setup(block);

%%
function setup(block)

% Register number of ports
block.NumInputPorts  = 0;
block.NumOutputPorts = 0;

% Register parameters
block.NumDialogPrms     = 1;

% Register sample times
block.SampleTimes = [0.05 0];

block.SimStateCompliance = 'DefaultSimState';

block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
block.RegBlockMethod('Terminate', @Terminate); % Required

%%
function Start(block)

obj.client = RemoteAPIClient();
obj.sim = obj.client.getObject('sim');

stepped = block.DialogPrm(1).Data;
obj.client.setStepping(stepped);

assignin('base','client',obj.client);
assignin('base','sim',obj.sim);
set_param(block.BlockHandle, 'UserData', obj);

%%
function InitializeConditions(block)

obj = get_param(block.BlockHandle, 'UserData');
obj.sim.startSimulation();

%%
function Outputs(block)

obj = get_param(block.BlockHandle, 'UserData');
obj.client.step();

%%
function Terminate(block)

obj = get_param(block.blockHandle, 'UserData');
obj.sim.stopSimulation();
