function vars = CS4300_Update_Vars(sentences, v)
% CS4300_Update_Vars - updates the vars
% On input:
%   sentences (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
%   v (int array): all variables used
% On output:
%   vars (int array): all variables used
% Call:  (example from Russell & Norvig, p. 252)
%     DP(1).clauses = [-1,2,3,4];
%     DP(2).clauses = [-2];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
%     vars = CS4300_Update_Vars(DP, []);
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

vars = v;
for i = 1:length(sentences)
  vars = [vars, abs(sentences(i).clauses)];
end
vars = unique(vars);

end

