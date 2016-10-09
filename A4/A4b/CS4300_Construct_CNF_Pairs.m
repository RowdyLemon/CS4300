function new_clauses = CS4300_Construct_CNF_Pairs(sentences, thm)
% CS4300_Construct_CNF_Pairs - Builds a CNF Pairs struct
% On input:
%   sentences (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
%   thm (CNF datastructure): a conjunct of disjunctive clauses
%                            to be tested
% On output:
%   new_clauses (CNF data structure): Contains all pairings each clause
% Call:
%   DP(1).clauses = [-1,2,3,4];
%   DP(2).clauses = [-2];
%   DP(3).clauses = [-3];
%   DP(4).clauses = [1];
%   thm.clauses = [4];
%   new_clauses = CS4300_Construct_CNF_Pairs(DP,thm);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
new_clauses = [];

for i = 1:length(sentences)
  if (length(sentences(i).clauses) < 2)
    new_clauses(end+1).formula = sentences(i).clauses;
	continue;
  end
  for j = 1:length(sentences(i).clauses)
    for k = j + 1:length(sentences(i).clauses)
      new_clauses(end+1).formula = [sentences(i).clauses(j), sentences(i).clauses(k)];
    end
  end
end

% for i = 1:length(thm.clauses)
% 	new_clauses(end+1).formula = -thm.clauses(i);
% end

for i = 1:length(thm)
	new_clauses(end+1).formula = -thm(i);
end

