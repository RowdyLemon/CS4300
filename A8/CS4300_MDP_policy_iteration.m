function [policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R,k,gamma)
% CS4300_MDP_policy_iteration - policy iteration
% Chapter 17 Russell and Norvig (Table p. 657)
% On input:
%   S (vector): states (1 to n)
%   A (vector): actions (1 to k)
%   P (nxk array): transition model
%   R (vector): state rewards
%   gamma (float): discount factor
%   k (int): number of iterations
% On output:
%   p (nx1 vector): policy
% Call:
%
% Layout: 1
% ˆ
%   9 10 11 12 |
%   5 6 7 8 2 <- -> 4
%   1 2 3 4 |
%   V
%   3
%   [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000);
%   p = CS4300_MDP_policy_iteration(S,A,P,R,10,0.999)
%   p’
%
%   ans =
%
%   1 corrresponds to:
%   2
%   2 -> -> -> X
%   2 ˆ X ˆ X
%   1 ˆ <- <- <-
%   1
%   1
%   1
%   4
%   4
%   4
%   1
%
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

U = (R~=median(R)).*R;
% pi = 2 * ones(1, length(S));
pi = zeros(1, length(S));
for i=1:length(S)
   pi(i) = randi(4);
end

unchanged = false;
Ut = [];

while ~unchanged
    U = CS4300_Policy_Evaluation(pi, U, S, A, P, R, gamma, k);
    unchanged = true;
    for s=1:length(S)
        up = dot(P(s, A(1)).probs, U);
        left = dot(P(s, A(2)).probs, U);
        down = dot(P(s, A(3)).probs, U);
        right = dot(P(s, A(4)).probs, U);
        [v, i] = max([up, left, down, right]);
        if v > U(s) && i ~= pi(s)
            pi(s) = i;
            unchanged = false;
        end
    end
    Ut(end+1).trace = U;
end

policy = pi;
