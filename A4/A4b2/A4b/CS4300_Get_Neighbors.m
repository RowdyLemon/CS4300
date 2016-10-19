function neighbors = CS4300_Get_Neighbors(cell, visited)
% CS4300_Get_Neighbors - returns neighbors of given cell
% On input:
%   cell (1x2 matrix): x, y location of cell
% On output:
%   neighbors (nx2 matrix): x, y coords of all neighbors of the given cell
% Call:
%   neighbors = CS4300_Get_Neighbors([1,1]);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

neighbors = [];
x = cell(1);
y = cell(2);

if(x > 1 && ~ismember([x-1, y], visited, 'rows'))
  neighbors = [neighbors; x-1, y];  
end
if(x < 4 && ~ismember([x+1, y], visited, 'rows'))
  neighbors = [neighbors; x+1, y];
end
if(y > 1 && ~ismember([x, y-1], visited, 'rows'))
  neighbors = [neighbors; x, y-1];
end
if(y < 4 && ~ismember([x, y+1], visited, 'rows'))
  neighbors = [neighbors; x, y+1];
end

end

