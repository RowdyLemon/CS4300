function [plan, places, visited, board] = CS4300_Figure_Out_Plan(b, agent, old_places, v)
% CS4300_Figure_Out_Plan - creates a plan and updates places to visit
% On input:
%   b (4x4 Matrix): Describes current knowledge of board
%   agent (1x3 Vector): agent state
%   old_places (nx2 matrix): list of locations we want to visit
%   v (nx2 matrix): list of places we have visited
% On output:
%   plan (Array): actions to perform
%   places (nx2 matrix): x, y coords of places to visit
%   visited (nx2 matrix): x, y coords of places to visit
%   board (4x4 matrix): agents perceived state of the wumpus world
% Call:
%   pits = -ones(4);
%   wumpus = -ones(4);
%   board = ones(4);
%   agent = [1,1,0];
%   [plan, places] = CS4300_Update_Boards(pits, wumpus, board,
%   agent, KB, old_places);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

b = rot90(b, -1);

% add locations we want to visit to places
% check: 
%   1) not a wumpus or pit
%   2) not a place we have already visited
%   3) and its not already a place we plan on visiting
% if these conditions are met we add it to places
if(agent(1) > 1) 
  if(b(agent(1)-1, agent(2)) < 1 ...
     && ~ismember([agent(1)-1, agent(2)], v, 'rows') ...
     && ~ismember([agent(1)-1, agent(2)], old_places, 'rows'))
    old_places = [agent(1)-1, agent(2); old_places];
  end
end
if(agent(1) < 4)
  if(b(agent(1)+1, agent(2)) < 1 ...
     && ~ismember([agent(1)+1, agent(2)], v, 'rows') ...
     && ~ismember([agent(1)+1, agent(2)], old_places, 'rows'))
    old_places = [agent(1)+1, agent(2); old_places];
  end
end
if(agent(2) > 1)
  if(b(agent(1), agent(2)-1) < 1 ...
     && ~ismember([agent(1), agent(2)-1], v, 'rows') ...
     && ~ismember([agent(1), agent(2)-1], old_places, 'rows'))
    old_places = [agent(1), agent(2)-1; old_places];
  end
end
if(agent(2) < 4)
  if(b(agent(1), agent(2)+1) < 1 ...
     && ~ismember([agent(1), agent(2)+1], v, 'rows') ...
     && ~ismember([agent(1), agent(2)+1], old_places, 'rows'))
    old_places = [agent(1), agent(2)+1; old_places];
  end
end
places = old_places;

% Start: if theres no place we can to visit
% choose a frontier node, shoot an arrow into it
% mark it safe then continue
if(sum(places(1,:) == [-1,-1]) == 2)
  [place, plan] = CS4300_The_Final_Frontier(v, agent, rot90(b));
  places = [place; places];
  visited = v;
  b(place(1), place(2)) = 0;
  board = rot90(b);
  return;
end

goal = places(1,:);
places = places(2:end,:);
visited = [v; goal];
board = rot90(b);
[so, no] = CS4300_Wumpus_A_star(board, agent, [goal, 0], 'CS4300_A_star_Man');
plan = so(2:end,4);
end

