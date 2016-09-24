function [clause, resolved] = CS4300_Resolution(a, b)
% CS4300_Resolution - resolution rule
% On input: 1x2 vector
%   a vector: clause
%   b vector: clause
% On output:
%   clause vector: result of resolution
% Call: 
% a = [1,2]
% b = [-2, 3]
% clause = CS4300_Resolution(a,b);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
% Fall 2016
%
clause = [];
resolved = false;
for i = 1:length(a)
	for j = 1:length(b)
		if ((a(i) + b(j)) == 0)
			a(i) = [];
			b(j) = [];
			clause = [a, b];
			resolved = true;
			return;
		end	
	end
end



