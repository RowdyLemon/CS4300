function [revised, revised_row] = CS4300_Revise(i, Di, j, Dj, P)
% CS4300_Revise - Revise function from Mackworth paper 1977
% On input:
% 	i (1xn array): Row i
%   Di (int): domain i index
%	  j (1xn array): Row j
%   Dj (int): domain j index
%   P (string): predicate function name; P(i,a,j,b) takes as
%   arguments:
%     i (int): start node index
%     a (int): start node domain value
%     j (int): end node index
%     b (int): end node domain value
% On output:
%   deleted (boolean): true if deleted item
%   revised_row (1xn array): updated row
% Call:
%   i = [1,1,1,1];
%   j = [1,1,1,1];
%   [revised, revised_row] = CS4300_Revise(i, j,’CS4300_P_no_attack’);
% Author:
% Matthew Lemon
% UU575787
% Derek Heldt-Werle
% UU828479
% Fall 2016
%

revised = false;
revised_row = i;

for x = 1:length(i)
  if(i(x) == 0)
    continue;
  end
  satisfied = false;
  for y = 1:length(j)
    if(j(y) == 0)
      continue;
    end
    if(~satisfied)
      satisfied = CS4300_P_no_attack(x, Di, y, Dj);
    end
  end
  if(~satisfied)
    revised_row(x) = 0;
    revised = true;
  end
end
