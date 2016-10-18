function sentence = CS4300_Make_Percept_Sentence(percept, location)
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

sentence = [];

if(percept(1))
  sentence(end+1).clauses = CS4300_Map_ID(3, location);
else
  sentence(end+1).clauses = -CS4300_Map_ID(3, location);
end

if(percept(2))
  sentence(end+1).clauses = CS4300_Map_ID(4, location);
else
  sentence(end+1).clauses = -CS4300_Map_ID(4, location);
end

if(percept(3))
  sentence(end+1).clauses = CS4300_Map_ID(5, location);    
else
  sentence(end+1).clauses = -CS4300_Map_ID(5, location);
end

end