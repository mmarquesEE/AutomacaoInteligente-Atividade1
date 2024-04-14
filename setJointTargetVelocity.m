function setJointTargetVelocity(block)

setup(block);

%%
function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 0;

% Override input port properties
block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DatatypeID  = 0;  % double
block.InputPort(1).Complexity  = 'Real';
block.InputPort(1).DirectFeedthrough = true;
block.InputPort(1).SamplingMode = 'Sample';

% Register parameters
block.NumDialogPrms     = 1;

% Register sample times
block.SampleTimes = [0.05 0];

block.SimStateCompliance = 'DefaultSimState';

block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Outputs', @Outputs);     % Required
block.RegBlockMethod('Terminate', @Terminate); % Required

%%
function InitializeConditions(block)

obj.client = evalin('base','client');
obj.sim = evalin('base','sim');

path = block.DialogPrm(1).Data;
obj.handle = obj.sim.getObject(path);

set_param(block.BlockHandle, 'UserData', obj);

%%
function Outputs(block)

obj = get_param(block.BlockHandle, 'UserData');

vel = single(block.InputPort(1).Data);
obj.sim.setJointTargetVelocity(obj.handle,vel);

%%
function Terminate(block)
