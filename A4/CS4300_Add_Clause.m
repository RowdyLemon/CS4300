function new_clauses = CS4300_Add_Clause(clauses, clause)
% CS4300_Add_Clause - adds a new clause to the list of clauses
% On input:
%   clauses (list of clauses): struct containing constructed sentences
%     (i).formula
%       each clause is a list of integers (- for negated literal)
%   clause (1x2 vector): list of variables
% On output:
%   new_clauses (list of clauses): updated clauses list with new clause
%   added
% Call:
%   clauses(1).formula = [1, 2];
%   clauses(2).formula = [3, 5];
%   clause = [2, 4];
%   new_clauses = CS4300_Add_Clause(clauses,clause);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

new_clauses = clauses;
contained = false;

for k = 1:length(new_clauses)
  if(length(clause) ~= length(new_clauses(k).formula))
    continue;
  end
  if (new_clauses(k).formula == clause | new_clauses(k).formula == fliplr(clause))
    contained = true;
  end
end

if(~contained)
  new_clauses(end+1).formula = clause;
end
