function [pits, wumpus, board] = CS4300_Update_Boards(p, w, b, agent, KB)
% CS4300_Update_Boards - updates board states
% On input:
%   p (4x4 Matrix): Describes current knowledge of pits
%   w (4x4 Matrix): Describes current knowledge of wumpus
%   b (4x4 Matrix): Describes current knowledge of board
% On output:
%   pits (4x4 Matrix): Updated current knowledge of pits
%   wumpus (4x4 Matrix): Updated current knowledge of wumpus
%   board (4x4 Matrix): Updated current knowledge of board
% Call: (example from Russell & Norvig, p. 252)
%   pits = -ones(4);
%   wumpus = -ones(4);
%   board = ones(4);
%   agent = [1,1,0];
%   [pits, wumpus, board] = CS4300_Update_Boards(pits, wumpus, board,
%   agent);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

p(agent(1:2)) = 0;
w(agent(1:2)) = 0;
b(agent(1:2)) = 0;

% Check and update left position
if(agent(1) > 1)
  if(p(agent(1)-1, agent(2)) < 0 || w(agent(1)-1, agent(2)) < 0)
    p(agent(1)-1, agent(2)) = CS4300_Ask(KB, CS4300_Map_ID(1, [agent(1)-1, agent(2)]), []);
    w(agent(1)-1, agent(2)) = CS4300_Ask(KB, CS4300_Map_ID(2, [agent(1)-1, agent(2)]), []);
    if(w(agent(1)-1, agent(2)) == 1)
      b(agent(1)-1, agent(2)) = 3;
    elseif(p(agent(1)-1, agent(2)) == 0)
      b(agent(1)-1, agent(2)) = 0;
    end
  end
end

% Check and update right position
if(agent(1) < 4)
  if(p(agent(1)+1, agent(2)) < 0 || w(agent(1)+1, agent(2)) < 0)
    p(agent(1)+1, agent(2)) = CS4300_Ask(KB, CS4300_Map_ID(1, [agent(1)+1, agent(2)]), []);
    w(agent(1)+1, agent(2)) = CS4300_Ask(KB, CS4300_Map_ID(2, [agent(1)+1, agent(2)]), []);
    if(w(agent(1)+1, agent(2)) == 1)
      b(agent(1)+1, agent(2)) = 3;
    elseif(p(agent(1)+1, agent(2)) == 0)
      b(agent(1)+1, agent(2)) = 0;
    end
  end
end

% Check and update bottom position
if(agent(2) > 1)
  if(p(agent(1), agent(2)-1) < 0 || w(agent(1), agent(2)-1) < 0)
    p(agent(1), agent(2)-1) = CS4300_Ask(KB, CS4300_Map_ID(1, [agent(1), agent(2)-1]), []);
    w(agent(1), agent(2)-1) = CS4300_Ask(KB, CS4300_Map_ID(2, [agent(1), agent(2)-1]), []);
    if(w(agent(1), agent(2)-1) == 1)
      b(agent(1), agent(2)-1) = 3;
    elseif(p(agent(1), agent(2)-1) == 0)
      b(agent(1), agent(2)-1) = 0;
    end
  end
end

% Check and update top position
if(agent(2) < 4)
  if(p(agent(1), agent(2)+1) < 0 || w(agent(1), agent(2)+1) < 0)
    p(agent(1), agent(2)+1) = CS4300_Ask(KB, CS4300_Map_ID(1, [agent(1), agent(2)+1]), []);
    w(agent(1), agent(2)+1) = CS4300_Ask(KB, CS4300_Map_ID(2, [agent(1), agent(2)+1]), []);
    if(w(agent(1), agent(2)+1) == 1)
      b(agent(1), agent(2)+1) = 3;
    elseif(p(agent(1), agent(2)+1) == 0)
      b(agent(1), agent(2)+1) = 0;
    end
  end
end

pits = p;
wumpus = w;
board = b;

end

