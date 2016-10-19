function [place, plan] = CS4300_The_Final_Frontier(visited, agent, board)
% CS4300_The_Final_Frontier - "These are the voyages of the starship
% enterprise. Its continueing mission to explore strange new worlds. To
% seek out new life and new civilizations. To boldly go where no one has
% gone before... duh nuh nuh nuh duh nuh nuh" - Patrick Stewart
% On input:
%   visited (nx2 matrix): list of locations we have visited
%   agent (1x3 matrix): x, y, dir of agent
%   board (4x4 matrix): agents view of the wumpus world
% On output:
%   place (1x2 matrix): x, y location to visit
%   plan (nx1 matrix): actions to shoot wumpus
% Call:
%   [place, plan] = CS4300_The_Final_Frontier(visited, agent);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

for i = 1:length(visited)
  neighbors = CS4300_Get_Neighbors(visited(i,:), visited);
  if(isempty(neighbors))
    continue;
  end
  j = randi(length(neighbors));

  [so, no] = CS4300_Wumpus_A_star(board, agent, [visited(i,:),0], 'CS4300_A_star_Man');
  plan = so(2:end,:);
  % get final direction
  dir = 0;
  if(neighbors(j,1) - visited(i,1) == 1)
    dir = 0;
  elseif(neighbors(j,1) - visited(i,1) == -1)
    dir = 2;
  elseif(neighbors(j,2) - visited(i,2) == 1)
    dir = 1;
  elseif(neighbors(j,2) - visited(i,2) == -1)
    dir = 3;
  end
  % add rotation action to face correct direction
  if(so(end, 3) - dir == -1)
    plan(end+1) = 3;
  elseif(so(end, 3) - dir == 1)
    plan(end+1) = 2;
  end
  % shoot arrow to kill wumpus
  plan(end+1) = 5;
  place = neighbors(j,:);
  return;
end

end

