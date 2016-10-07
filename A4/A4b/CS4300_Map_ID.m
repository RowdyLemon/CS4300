function var_id = CS4300_Map_ID(type, location)
% CS4300_Map_ID - returns the ID number of a given type at a given x, y
% On input:
%   type (int): ID of type 
%     - PITS = 1 
%     - WUMPUS = 2
%     - STENCH = 3
%     - BREEZE = 4
%     - GOLD = 5
%   location (1x2 matrix): x, y location
% On output:
%   var_id (int): ID number of given variable and location
% Call:
%   var_id = CS4300_Map_ID(1, [1, 1]);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

x = location(1);
y = location(2);

var_id = (x + (y-1)*4) + (type-1)*16;

end

