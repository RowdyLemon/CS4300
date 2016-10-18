function sentence = CS4300_Make_Percept_Sentence(percepts, location)
% CS4300_Make_Percept_Sentence - Creates CNF sentence from percepts
% On input:
%   percepts (1x5 array): percept boolean array 
%     - STENCH 
%     - BREEZE, 
%     - GLITTER, 
%     - SCREAM, 
%     - BUMP
%   location (1x2 array): current x y agent location
% On output:
%   sentence (CNF sentence): CNF sentence constructed from percepts
% Call:
%   percepts = [0, 0, 0, 1, 0]
%   sentence = CS4300_Make_Percept_Sentence(percepts);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

STENCH = 1;
BREEZE = 2;
GLITTER = 3;
x = location(1);
y = location(2);
sentence = [];

sentence(end+1).clauses = - CS4300_Map_ID(1, location);
sentence(end+1).clauses = - CS4300_Map_ID(2, location);

% Check Stench
if(percepts(STENCH))
  wumpus = [];
  wumpus(1).clauses = -CS4300_Map_ID(3, [x, y]);
  wumpus(2).clauses = [];
  if(x > 1)
    wumpus(2).clauses = [wumpus(2).clauses, CS4300_Map_ID(2, [x-1, y])];
  end
  if(x < 4)
    wumpus(2).clauses = [wumpus(2).clauses, CS4300_Map_ID(2, [x+1, y])];
  end
  if(y > 1)
    wumpus(2).clauses = [wumpus(2).clauses, CS4300_Map_ID(2, [x, y-1])];
  end
  if(y < 4)
    wumpus(2).clauses = [wumpus(2).clauses, CS4300_Map_ID(2, [x, y+1])];
  end
  sentence = [sentence, wumpus];
else
  sentence(end + 1).clauses = -CS4300_Map_ID(3, [x, y]);
  if(x > 1)
    sentence(end + 1).clauses = -CS4300_Map_ID(2, [x-1, y]);
  end
  if(x < 4)
    sentence(end + 1).clauses = -CS4300_Map_ID(2, [x+1, y]);
  end
  if(y > 1)
    sentence(end + 1).clauses = -CS4300_Map_ID(2, [x, y-1]);
  end
  if(y < 4)
    sentence(end + 1).clauses = -CS4300_Map_ID(2, [x, y+1]);
  end
end


% % Check Breeze
% if(percepts(BREEZE))
%   pit = [];
%   pit(1).clauses = -CS4300_Map_ID(4, [x, y]);
%   if(x > 1)
%     pit(1).clauses = [pit(1).clauses, CS4300_Map_ID(1, [x-1, y])];
%     pit(end+1).clauses = -CS4300_Map_ID(1, [x-1, y]);
%   end
%   if(x < 4)
%     pit(1).clauses = [pit(1).clauses, CS4300_Map_ID(1, [x+1, y])];
%     pit(end+1).clauses = -CS4300_Map_ID(1, [x+1, y]);
%   end
%   if(y > 1)
%     pit(1).clauses = [pit(1).clauses, CS4300_Map_ID(1, [x, y-1])];
%     pit(end+1).clauses = -CS4300_Map_ID(1, [x, y-1]);
%   end
%   if(y < 4)
%     pit(1).clauses = [pit(1).clauses, CS4300_Map_ID(1, [x, y+1])];
%     pit(end+1).clauses = -CS4300_Map_ID(1, [x, y+1]);
%   end
%   for i = 2:length(pit)
%     pit(i).clauses = [pit(i).clauses, CS4300_Map_ID(4, [x, y])];
%   end
%   sentence = [sentence, pit];
% else
%   sentence(end + 1).clauses = -CS4300_Map_ID(4, [x, y]);
%   if(x > 1)
%     sentence(end + 1).clauses = -CS4300_Map_ID(1, [x-1, y]);
%   end
%   if(x < 4)
%     sentence(end + 1).clauses = -CS4300_Map_ID(1, [x+1, y]);
%   end
%   if(y > 1)
%     sentence(end + 1).clauses = -CS4300_Map_ID(1, [x, y-1]);
%   end
%   if(y < 4)
%     sentence(end + 1).clauses = -CS4300_Map_ID(1, [x, y+1]);
%   end
% end

% Check Breeze
if(percepts(BREEZE))
  pit = [];
  pit(1).clauses = -CS4300_Map_ID(4, [x, y]);
  pit(2).clauses = [];
  if(x > 1)
    pit(2).clauses = [pit(2).clauses, CS4300_Map_ID(1, [x-1, y])];
  end
  if(x < 4)
    pit(2).clauses = [pit(2).clauses, CS4300_Map_ID(1, [x+1, y])];
  end
  if(y > 1)
    pit(2).clauses = [pit(2).clauses, CS4300_Map_ID(1, [x, y-1])];
  end
  if(y < 4)
    pit(2).clauses = [pit(2).clauses, CS4300_Map_ID(1, [x, y+1])];
  end
  sentence = [sentence, pit];
else
  sentence(end + 1).clauses = -CS4300_Map_ID(4, [x, y]);
  if(x > 1)
    sentence(end + 1).clauses = -CS4300_Map_ID(1, [x-1, y]);
  end
  if(x < 4)
    sentence(end + 1).clauses = -CS4300_Map_ID(1, [x+1, y]);
  end
  if(y > 1)
    sentence(end + 1).clauses = -CS4300_Map_ID(1, [x, y-1]);
  end
  if(y < 4)
    sentence(end + 1).clauses = -CS4300_Map_ID(1, [x, y+1]);
  end
end

if(percepts(GLITTER))
  sentence(end+1).clauses = CS4300_Map_ID(5, [x, y]);
else
  sentence(end+1).clauses = -CS4300_Map_ID(5, [x, y]);  
end

end