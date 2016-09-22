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

arc_queue = zeros(length(D)*(length(D)-1), 2);
head = 1;
tail = 1;

for i = 1:length(G)
  for j = 1:length(G)
    if(G(i,j))
      arc_queue(tail,:) = [i,j];
      tail = tail + 1;
    end
  end
end

while head ~= tail
  if(head > length(D)*(length(D)-1))
    head = 1; 
  end
  arc = arc_queue(head,:);
  arc_queue(head,:) = [0,0];
  head = head + 1;
  i = arc(1);
  j = arc(2);

  [revised, row] = CS4300_Revise(D(i,:), i, D(j,:), j, P);
  
  if(revised)
    D(i,:) = row;
    for k = 1:length(G)
      if(~G(i,k) || k == j)
        continue;
      end
      contained = false;
      for x = 1:length(arc_queue)
        if(arc_queue(x,:) == [k,i])
          contained = true;
          break;
        end
      end
      if(~contained)
         if(tail > length(D)*(length(D)-1))
           tail = 1; 
         end
         arc_queue(tail,:) = [k, i];
         tail = tail + 1;
      end      
    end
  end
end

D_revised = D;
