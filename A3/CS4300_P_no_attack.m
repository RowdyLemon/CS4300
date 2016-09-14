function not_attacked = CS4300_P_no_attack(i, a, j, b)
% CS4300_P_no_attack - queens attack predicate
% On input:
% 	i (int): start node index
%	a (int): start node domain value
%	j (int): end node index
%	b (int): end node domain value
% On output:
%   attacked (boolean): true if predicate fails
% Call:
%   not_attacked = CS4300_P_no_attack(1, 1, 3, 2);
% Author:
% Matthew Lemon
% UU575787
% Derek Heldt-Werle
% UU828479
% Fall 2016
%

not_attacked = true;

% check horizontal
if(i == j)
	not_attacked = false;
end

% check vertical
if(a == b)
	not_attacked = false;
end

% check diagonal
if(abs(i-j) == abs(a-b))
	not_attacked = false;
end
