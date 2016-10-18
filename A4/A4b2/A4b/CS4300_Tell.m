function KB = CS4300_Tell( KB, sentence )
% CS4300_Tell - Updates Knowledge base
% On input:
%   KB (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
%   sentence (1xn array):  array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal) 
% Call:
%   KB(1).clauses = [1,2];
%   sentence(1).clauses = [1, 3]
%   CS4300_Tell(KB, sentence);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

for i = 1:length(sentence)
    contained = false;
    for j = 1:length(KB)
        if(sum(ismember(KB(j).clauses, sentence(i).clauses)) == length(KB(j).clauses))
            contained = true;
        end
    end
    if (~contained)
        KB(end+1).clauses = sentence(i).clauses;
        contained = false;
    end
end

end

