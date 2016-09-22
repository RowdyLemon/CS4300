function D_revised = CS4300_AC1_Bad(G,D,P)
% CS4300_AC1 - AC1 function from Mackworth paper 1977
% On input:
%   G (nxn array): neighborhood graph for n nodes
%   D (nxm array): m domain values for each of n nodes
%   P (string): predicate function name; P(i,a,j,b) takes as
%   arguments:
%     i (int): start node index
%     a (int): start node domain value
%     j (int): end node index
%     b (int): end node domain value
% On output:
%   D_revised (nxm array): revised domain labels
% Call:
%   G = 1 - eye(3,3);
%   D = [1,1,1;1,1,1;1,1,1];
%   Dr = CS4300_AC1(G,D,’CS6100_P_no_attack’);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

changed = true;

while changed
  changed = false;
  for i=1:length(G)
    for j=1:length(G)
      if(G(i, j) == 0)
        continue;
      end
      [revised, row] = CS4300_Revise(D(i,:), i, D(j,:), j, P);
      if(revised)
        changed = true;
        D(i,:) = row;
      end
    end
  end
end

D_revised = D;