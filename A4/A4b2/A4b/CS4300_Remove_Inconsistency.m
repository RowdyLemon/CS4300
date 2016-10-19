function new_KB = CS4300_Remove_Inconsistency(KB)
% CS4300_Remove_Inconsistency - removes inconsistencies from the KB
% On input:
%   KB (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
% On output:
%   KB (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
% Call: (example from Russell & Norvig, p. 252)
%   DP(1).clauses = [-1,2,3,4];
%   DP(2).clauses = [-2];
%   DP(3).clauses = [2];
%   DP(4).clauses = [1];
%   KB = CS4300_Remove_Inconsistency(DP);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

num_Sip = 0;

for s = 1:length(KB)
  clauses = KB(s).clauses;
  found = 0;
  for c = 1:length(KB)
    if(sum(ismember(-clauses, KB(c).clauses)) == length(clauses))
      found = 1;
    end
  end
  if found==0
    num_Sip = num_Sip + 1;
    new_KB(num_Sip).clauses = clauses;
  end
end

