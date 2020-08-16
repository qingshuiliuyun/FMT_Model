function cellInfo = MAG_Bus(varargin) 
% MAG_BUS returns a cell array containing bus object information 
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
    'MAG_Bus', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'timestamp', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('ms'), ''}; ...
{'mag_x', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('gauss'), ''}; ...
{'mag_y', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('gauss'), ''}; ...
{'mag_z', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('gauss'), ''}; ...
    } ...
  } ...
}'; 

if ~suppressObject 
    % Create bus objects in the MATLAB base workspace 
    Simulink.Bus.cellToObject(cellInfo) 
end 
