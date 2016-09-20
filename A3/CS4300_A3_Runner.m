function [data, time_data] = CS4300_A3_Runner()
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

% data = zeros(8400, 5);
data = zeros(8400,6);
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
      D2 = CS4300_AC3_Bad(G, D, 'CS4300_Revise');
      t2 = toc;

      r1 = sum(D(:)) - sum(D1(:));
      r2 = sum(D(:)) - sum(D2(:));
      data(index,:) = [N, sum(D(:)), r1, r2, t1, t2];
      index = index + 1;
    end
  end
end

time_data = zeros(7,2);
for i = 0:6
  m = mean(data(i*1200+1:(i+1)*1200,:));
  time_data(i+1,:) = [m(5) m(6)];
end

n4 = sortrows(data(1:1200,2:3));
n5 = sortrows(data(1201:2400,2:3));
n6 = sortrows(data(2401:3600,2:3));
n7 = sortrows(data(3601:4800,2:3));
n8 = sortrows(data(4801:6000,2:3));
n9 = sortrows(data(6001:7200,2:3));
n10 = sortrows(data(7201:8400,2:3));

[UA, ~, idx] = unique(n4(:,1));
n4 = [UA, accumarray(idx, n4(:,2),[],@mean)];
[UA, ~, idx] = unique(n5(:,1));
n5 = [UA, accumarray(idx, n5(:,2),[],@mean)];
[UA, ~, idx] = unique(n6(:,1));
n6 = [UA, accumarray(idx, n6(:,2),[],@mean)];
[UA, ~, idx] = unique(n7(:,1));
n7 = [UA, accumarray(idx, n7(:,2),[],@mean)];
[UA, ~, idx] = unique(n8(:,1));
n8 = [UA, accumarray(idx, n8(:,2),[],@mean)];
[UA, ~, idx] = unique(n9(:,1));
n9 = [UA, accumarray(idx, n9(:,2),[],@mean)];
[UA, ~, idx] = unique(n10(:,1));
n10 = [UA, accumarray(idx, n10(:,2),[],@mean)];


plot(n4(1:end,1), n4(1:end,2));
hold on;
plot(n5(1:end,1), n5(1:end,2));
plot(n6(1:end,1), n6(1:end,2));
plot(n7(1:end,1), n7(1:end,2));
plot(n8(1:end,1), n8(1:end,2));
plot(n9(1:end,1), n9(1:end,2));
plot(n10(1:end,1), n10(1:end,2));
legend('N=4', 'N=5', 'N=6', 'N=7', 'N=8', 'N=9', 'N=10');
xlabel('Starting Number of Labels');
ylabel('Expected Reduction in Labels');
hold off;

for i = 0:1200:7200
  disp(strcat('solutions for: ', num2str(i)));
  for j = 1:200:1200
    disp(mean(data(i+j:i+j+199,:)));
  end
end

end

