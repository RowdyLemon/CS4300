function D_revised = CS4300_AC1(G,D,P)
% CS4300_AC3 - AC3 function
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
%   Dr = CS4300_AC1(G,D,'CS4300_P_no_attack');
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

changed = true;
arc_queue = [];
for i = 1:length(D)
  for j = 1:length(D)
    if(i == j)
      continue;
    end
    arc_queue(end+1,:) = [i, j];
  end
end

while changed
  changed = false;
  for k = 1:length(arc_queue)
    arc = arc_queue(k,:);
    i = arc(1);
    j = arc(2);
    [revised, row] = CS4300_Revise(D(i,:), i, D(j,:), j, P);
    if(revised)
      changed = true;
      D(i,:) = row;
    end
  end
end

D_revised = D;

