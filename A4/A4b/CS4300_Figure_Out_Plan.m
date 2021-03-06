function [plan, places, visited] = CS4300_Figure_Out_Plan(b, agent, old_places, v)
% CS4300_Figure_Out_Plan - creates a plan and updates places to visit
% On input:
%   p (4x4 Matrix): Describes current knowledge of pits
%   w (4x4 Matrix): Describes current knowledge of wumpus
%   b (4x4 Matrix): Describes current knowledge of board
%   agent (1x3 Vector): agent state
%   KB (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
%   places (nx2 matrix): x, y coords of places to visit
% On output:
%   plan (Array): actions to perform
%   places (nx2 matrix): x, y coords of places to visit
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

% add locations to places
if(agent(1) > 1)
  if(b(agent(1)-1, agent(2)) < 1 && ~ismember([agent(1)-1, agent(2)], v, 'rows') && ~ismember([agent(1)-1, agent(2)], old_places, 'rows'))
    old_places = [agent(1)-1, agent(2); old_places];
  end
end
if(agent(1) < 4)
  if(b(agent(1)+1, agent(2)) < 1 && ~ismember([agent(1)+1, agent(2)], v, 'rows') && ~ismember([agent(1)+1, agent(2)], old_places, 'rows'))
    old_places = [agent(1)+1, agent(2); old_places];
  end
end
if(agent(2) > 1)
  if(b(agent(1), agent(2)-1) < 1 && ~ismember([agent(1), agent(2)-1], v, 'rows') && ~ismember([agent(1), agent(2)-1], old_places, 'rows'))
    old_places = [agent(1), agent(2)-1; old_places];
  end
end
if(agent(2) < 4)
  if(b(agent(1), agent(2)+1) < 1 && ~ismember([agent(1), agent(2)+1], v, 'rows') && ~ismember([agent(1), agent(2)+1], old_places, 'rows'))
    old_places = [agent(1), agent(2)+1; old_places];
  end
end
places = old_places;

if(sum(places(1,:) == [-1,-1]) == 2)
% check if there is anywhere to go
% if(isempty(places))
  if(agent(1) > 1)
    if(b(agent(1)-1, agent(2)) == 1)
      places = [agent(1)-1, agent(2)];
    end
  elseif(agent(1) < 4)
    if(b(agent(1)+1, agent(2)) == 1)
      places = [agent(1)+1, agent(2)];
    end
  elseif(agent(2) > 1)
    if(b(agent(1), agent(2)-1) == 1)
      places = [agent(1), agent(2)-1];
    end
  elseif(agent(2) < 4)
    if(b(agent(1), agent(2)+1) == 1)
      places = [agent(1), agent(2)+1];
    end
  end
end

goal = places(1,:);
places = places(2:end,:);
visited = [v; goal];
b = CS4300_Fix_Board(b);
b = CS4300_Fix_Board(b);
b = CS4300_Fix_Board(b);
[so, no] = CS4300_Wumpus_A_star(b, agent, [goal, 0], 'CS4300_A_Star_Man');
plan = so(:,4);

end

