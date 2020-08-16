function cellInfo = mavlink_bus(varargin) 
% MAVLINK_BUS returns a cell array containing bus object information 
% 
% Optional Input: 'false' will suppress a call to Simulink.Bus.cellToObject 
%                 when the MATLAB file is executed. 
% The order of bus element attributes is as follows:
%   ElementName, Dimensions, DataType, SampleTime, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description 

suppressObject = false; 
if nargin == 1 && islogical(varargin{1}) && varargin{1} == false 
    suppressObject = true; 
elseif nargin > 1 
    error('Invalid input argument(s) encountered'); 
end 

cellInfo = { ... 
  { ... 
    'mavlink_fmt_pilot_cmd_t', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'timestamp', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('timestamp in milliseconds')}; ...
{'ls_lr', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Left stick left/right')}; ...
{'ls_ud', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Left stick up/down')}; ...
{'rs_lr', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Right stick left/right')}; ...
{'rs_ud', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Right stick up/down')}; ...
{'mode', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Control Mode')}; ...
{'command_1', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Pilot command 1')}; ...
{'command_2', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('Pilot command 2')}; ...
    } ...
  } ...
}'; 

if ~suppressObject 
    % Create bus objects in the MATLAB base workspace 
    Simulink.Bus.cellToObject(cellInfo) 
end 
