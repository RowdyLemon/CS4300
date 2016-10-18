function KB = CS4300_Initialize_KB()
% CS4300_Initialize_KB - adds all the rules of the wumpus world to the KB
% On output:
%   KB (struct): initialized with rules of wumpus world
% Call:
%   KB = CS4300_Initialize_KB();
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

KB = [];

% Breeze rules
for i=1:3
  for j=1:3
    breezes(1).clauses = -CS4300_Map_ID(4, [i,j]);
    if(i > 1)
      breezes(1).clauses = [breezes(1).clauses, CS4300_Map_ID(1, [i-1, j])];
      breezes(end+1).clauses = [-CS4300_Map_ID(1, [i-1, j]), CS4300_Map_ID(4, [i,j])];
    end
    if(i < 4)
      breezes(1).clauses = [breezes(1).clauses, CS4300_Map_ID(1, [i+1, j])];
      breezes(end+1).clauses = [-CS4300_Map_ID(1, [i+1, j]), CS4300_Map_ID(4, [i,j])];
    end
    if(j > 1)
      breezes(1).clauses = [breezes(1).clauses, CS4300_Map_ID(1, [i, j-1])];
      breezes(end+1).clauses = [-CS4300_Map_ID(1, [i, j-1]), CS4300_Map_ID(4, [i,j])];
    end
    if(j < 4)
      breezes(1).clauses = [breezes(1).clauses, CS4300_Map_ID(1, [i, j+1])];
      breezes(end+1).clauses = [-CS4300_Map_ID(1, [i, j+1]), CS4300_Map_ID(4, [i,j])];    
    end
    KB = [KB, breezes];
    breezes = [];
  end
end

% Stench rules
for i=1:3
  for j=1:3
    stenches(1).clauses = -CS4300_Map_ID(3, [i,j]);
    if(i > 1)
      stenches(1).clauses = [stenches(1).clauses, CS4300_Map_ID(2, [i-1, j])];
      stenches(end+1).clauses = [-CS4300_Map_ID(2, [i-1, j]), CS4300_Map_ID(3, [i,j])];
    end
    if(i < 4)
      stenches(1).clauses = [stenches(1).clauses, CS4300_Map_ID(2, [i+1, j])];
      stenches(end+1).clauses = [-CS4300_Map_ID(2, [i+1, j]), CS4300_Map_ID(3, [i,j])];
    end
    if(j > 1)
      stenches(1).clauses = [stenches(1).clauses, CS4300_Map_ID(2, [i, j-1])];
      stenches(end+1).clauses = [-CS4300_Map_ID(2, [i, j-1]), CS4300_Map_ID(3, [i,j])];
    end
    if(j < 4)
      stenches(1).clauses = [stenches(1).clauses, CS4300_Map_ID(2, [i, j+1])];
      stenches(end+1).clauses = [-CS4300_Map_ID(2, [i, j+1]), CS4300_Map_ID(3, [i,j])];    
    end
    KB = [KB, stenches];
    stenches = [];
  end
end

KB(end+1).clauses = -CS4300_Map_ID(1, [1,1]);
KB(end+1).clauses = -CS4300_Map_ID(2, [1,1]);

end

