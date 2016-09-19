function data = CS4300_A3_Runner()
% CS4300_A3_Runner - Builds statistical data on AC1 and AC3
% Call:
%   CS4300_A3_Runner();
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

data = zeros(8400, 5);
index = 1;

for N = 4:10
  G = ~eye(N, N);
  for p = 0:0.2:1
    for t = 1:200
      D = rand(N, N) < p;
      tic;
%       D1 = CS4300_AC1(G, D, 'CS4300_Revise');
      D1 = CS4300_AC1_Bad(G, D, 'CS4300_Revise');
      t1 = toc;
      tic;
      D2 = CS4300_AC3(G, D, 'CS4300_Revise');
      t2 = toc;
      r1 = sum(D(:)) - sum(D1(:));
      r2 = sum(D(:)) - sum(D2(:));
      data(index,:) = [N, r1, r2, t1, t2];
      index = index + 1;
    end
  end
end
end

