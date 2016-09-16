function D_revised = CS4300_AC3(G,D,P)
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

arc_queue = [,];

for i = 1:length(D)
  for j = 1:length(D)
    if(i == j)
      continue;
    end
    arc_queue(end+1,:) = [i, j];
  end
end

while ~isempty(arc_queue)
  changed = false;
  arc = arc_queue(1,:);
  arc_queue(1,:) = [];
  i = arc(1);
  j = arc(2);

  if(G(i, j) == 0)
    continue;
  end

  [revised, row] = CS4300_Revise(D(i,:), i, D(j,:), j, P);
  
  if(revised)
    D(i,:) = row;
    changed = true;
  end

  if(changed)
    contained = false;
    for x = 1:length(D)
      if(i == x)
        continue;
      end
      for y = 1:length(arc_queue)
        if(arc_queue(y,:) == [i, x])
          contained = true;
        end
      end
      if(~contained)
        arc_queue(end+1,:) = [i, x];
        contained = false;
      end
    end
  end

end

D_revised = D;