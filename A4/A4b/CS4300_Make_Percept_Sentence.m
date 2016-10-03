function sentence = CS4300_Make_Percept_Sentence(percepts, location)
% CS4300_Make_Percept_Sentence - Creates CNF sentence from percepts
% On input:
%   percepts (1x5 array): percept boolean array [PIT, WUMPUS, STENCH,
%   BREEZE, GLITTER]
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

STENCH = 3;
BREEZE = 4;
GLITTER = 5;
x = location(1);
y = location(2);
sentence = [];

% Check Stench
if(percepts(STENCH))
  wumpus = [];
  if(x > 1)
    wumpus(1).clauses = ((x-1) + (y-1)*4) + 16;
    wumpus(end+1).clauses = -(((x-1) + (y-1)*4) + 16);
  end
  if(x < 4)
    wumpus(1).clauses = [wumpus(1).clauses, ((x+1) + (y-1)*4) + 16];
    wumpus(end+1).clauses = -(((x+1) + (y-1)*4) + 16);
  end
  if(y > 1)
    wumpus(1).clauses = [wumpus(1).clauses, (x + (y-2)*4) + 16];
    wumpus(end+1).clauses = -((x + (y-2)*4) + 16);
  end
  if(y < 4)
    wumpus(1).clauses = [wumpus(1).clauses, (x + y*4) + 16];
    wumpus(end+1).clauses = -((x + y*4) + 16);
  end
  wumpus(1).clauses = [wumpus(1).clauses, -((x + (y-1)*4) + 32)];
  for i = 2:length(wumpus)
    wumpus(i).clauses = [wumpus(i).clauses, ((x + (y-1)*4) + 32)];
  end
  sentence = [sentence, wumpus];
end

% Check Breeze
if(percepts(BREEZE))
  pit = [];
  pit(1).clauses = [];
  if(x > 1)
    pit(1).clauses = ((x-1) + (y-1)*4);
    pit(end+1).clauses = -(((x-1) + (y-1)*4));
  end
  if(x < 4)
    pit(1).clauses = [pit(1).clauses, ((x+1) + (y-1)*4)];
    pit(end+1).clauses = -(((x+1) + (y-1)*4));
  end
  if(y > 1)
    pit(1).clauses = [pit(1).clauses, (x + (y-2)*4)];
    pit(end+1).clauses = -((x + (y-2)*4));
  end
  if(y < 4)
    pit(1).clauses = [pit(1).clauses, (x + y*4)];
    pit(end+1).clauses = -((x + y*4));
  end
  pit(1).clauses = [pit(1).clauses, -((x + (y-1)*4) + 48)];
  for i = 2:length(pit)
    pit(i).clauses = [pit(i).clauses, ((x + (y-1)*4) + 48)];
  end
  sentence = [sentence, pit];
end

if(percepts(GLITTER))
  sentence(end+1).clauses = ((x + (y-1)*4) + 80);
end

end