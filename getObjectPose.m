function getObjectPose(block)

setup(block);

%%
function setup(block)

% Register number of ports
block.NumInputPorts  = 0;
block.NumOutputPorts = 1;

% Override output port properties
block.OutputPort(1).Dimensions       = [3,1];
block.OutputPort(1).DatatypeID  = 0; % double
block.OutputPort(1).Complexity  = 'Real';
block.OutputPort(1).SamplingMode = 'Sample';

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

pos = obj.sim.getObjectPosition(obj.handle,-1);
ori = obj.sim.getObjectOrientation(obj.handle,-1);
[x,y,~] = pos{:}; [~,~,theta] = ori{:};

block.OutputPort(1).Data = double([x;y;theta]);

%%
function Terminate(block)

