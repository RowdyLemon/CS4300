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
%   thm = [4];
%   vars = [1,2,3,4];
% Sr = CS4300_RTP(DP,thm,vars);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
% Fall 2016
%

pairs = [];
count = 2;
i = 1
for i = i:length(sentences(i).clauses)
	if (length(sentences(i).clauses < 2))
		pairs(end+1).formula = sentences(i).clauses;
		continue;
	end
	for j = i + 1:length(sentences(i))
		pairs(end+1).formula = [sentences(i).clauses(i), sentences(i).clauses(j)]
	end
end

for i = 1:length(thm)
	pairs(end+1).formula = -thm(i)
end

changed = true;
while changed
	changed = false;

	for i = 1:length(pairs)
		for j = 1:length(pairs)
            if (i == j)
                continue;
            end
			[clause, resolution] = CS4300_Resolution(pairs(i).formula, pairs(j).formula);
			if (resolution)
				if (isempty(clause))
					Sip = pairs;
					return;
                end
                containsFlag = false;
                changed = resolution;   
				for k = 1:length(pairs)                
					if (pairs(k).formula == clause)
                        containsFlag = true;
                    end
                end
                if (~containsFlag)
                    pairs(end+1).formula = clause;
                end
            end
        end
    end
end

end