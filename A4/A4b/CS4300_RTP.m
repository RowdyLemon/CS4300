function Sip = CS4300_RTP(sentences,thm,vars)
% CS4300_RTP - resolution theorem prover
% On input:
%   sentences (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
%   thm (CNF datastructure): a conjunct of disjunctive clauses
%                            to be tested
%   vars (1xn vector): list of variables (positive integers)
% On output:
%   Sip (CNF data structure): results of resolution
%     []: proved sentence |- thm
%     not []: thm does not follow from sentences
% Call: (example from Russell & Norvig, p. 252)
%   DP(1).clauses = [-1,2,3,4];
%   DP(2).clauses = [-2];
%   DP(3).clauses = [-3];
%   DP(4).clauses = [1];
%   thm.clauses = [4];
%   vars = [1,2,3,4];
% Sr = CS4300_RTP(DP,thm,vars);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

pairs = CS4300_Construct_CNF_Pairs(sentences, thm);
Sip = [];

while true
  temp = pairs;
  for i = 1:length(pairs)
    for j = 1:length(pairs)
      [clause, resolved] = CS4300_Resolution(pairs(i).formula, pairs(j).formula);
      if(resolved)
        if(isempty(clause))
          Sip = pairs;
          return;
        end
        temp = CS4300_Add_Clause(temp, clause);
      end
    end
  end
  if(length(temp) == length(pairs))
    return; 
  end
  pairs = temp;
end
