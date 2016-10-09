function thm_proved = CS4300_Ask(KB, thm, vars)
% CS4300_Ask - ask if thm is proven based on knowledge base
% On input:
%   KB (CNF data structure): array of conjuctive clauses
%     (i).clauses
%       each clause is a list of integers (- for negated literal)
%   thm (CNF datastructure): a conjunct of disjunctive clauses
%                            to be tested
%   vars (1xn vector): list of variables (positive integers)
% On output:
%   thm_proved (boolean): Theorem proved based on KB
% Call: (example from Russell & Norvig, p. 252)
%   DP(1).clauses = [-1,2,3,4];
%   DP(2).clauses = [-2];
%   DP(3).clauses = [-3];
%   DP(4).clauses = [1];
%   thm.clauses = [4];
%   vars = [1,2,3,4];
% thm_proved = CS4300_Ask(DP,thm,vars);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

thm_proved = -1;
if(~isempty(CS4300_RTP(KB, thm, vars)))
  thm_proved = 1;
elseif(~isempty(CS4300_RTP(KB, -thm, vars)))
  thm_proved = 0;
end

% sip = CS4300_RTP(KB, thm, vars);
% thm_proved = false;
% if(~isempty(sip))
%   thm_proved = true;
% end

end

