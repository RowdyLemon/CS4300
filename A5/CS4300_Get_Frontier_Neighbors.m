function [neighbors, safe_neighbors] = CS4300_Get_Frontier_Neighbors(agent, ...
    visited, frontier, percept, safe)
% CS4300_Get_Neighbors - returns neighbors of given cell
% On input:
%   agent (agent struct): x, y location of agent
%   visited (nx2): x, y locations of visited cells
%   frontier (nx2): x, y locations of frontier cells
% On output:
%   neighbors (nx2 matrix): x, y coords of all neighbors of the given cell
% Call:
%   agent = [1,1];
%   visited = [1,1];
%   frontier = [];
%   frontier = [frontier; CS4300_Get_Frontier_Neighbors(cell, visited, frontier)];
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

neighbors = [];
safe_neighbors = [];
x = agent.x;
y = agent.y;

if(x > 1 ...
   && ~ismember([x-1, y], visited, 'rows') ...
   && ~ismember([x-1, y], frontier, 'rows') ...
   && ~ismember([x-1, y], safe, 'rows'))
    if ~percept(1) && ~percept(2)
        safe_neighbors = [safe_neighbors; x-1, y];
    else
        neighbors = [neighbors; x-1, y];
    end
end

if(x < 4 ...
   && ~ismember([x+1, y], visited, 'rows') ...
   && ~ismember([x+1, y], frontier, 'rows') ...
   && ~ismember([x+1, y], old_safe, 'rows'))
    if ~percept(1) && ~percept(2)
        safe_neighbors = [safe_neighbors; x+1, y];
    else
        neighbors = [neighbors; x+1, y];
    end
end
if(y > 1 ...
   && ~ismember([x, y-1], visited, 'rows') ...
   && ~ismember([x, y-1], frontier, 'rows') ...
   && ~ismember([x, y-1], old_safe, 'rows'))
    if ~percept(1) && ~percept(2)
        safe_neighbors = [safe_neighbors; x, y-1];
    else
        neighbors = [neighbors; x, y-1];
    end
end
if(y < 4 ...
   && ~ismember([x, y+1], visited, 'rows') ... 
   && ~ismember([x, y+1], frontier, 'rows') ...
   && ~ismember([x, y+1], old_safe, 'rows'))
    if ~percept(1) && ~percept(2)
        safe_neighbors = [safe_neighbors; x, y+1];
    else
        neighbors = [neighbors; x, y+1];
    end
end

end

