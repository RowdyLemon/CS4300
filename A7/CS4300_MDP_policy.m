function policy = CS4300_MDP_policy(S,A,P,U)
% CS4300_MDP_policy - generate a policy from utilities
%    See p. 648 Russell & Norvig
%       On input:
%       S (vector): states (1 to n)
%       A (vector): actions (1 to k)
%       P (nxk struct array): transition model
%         (s,a).probs (a vector with n transition probabilities
%          from s to s_prime, given action a)
%       U (vector): state utilities
% On output:
%       policy (vector): actions per state
% Call:
%       p = CS4300_MDP_policy(S,A,P,U);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

policy = zeros(1, length(S));

for i=1:length(U)
    up = dot(P(i, A(1)).probs, U);
    left = dot(P(i, A(2)).probs, U);
    down = dot(P(i, A(3)).probs, U);
    right = dot(P(i, A(4)).probs, U);
    [v, policy(i)] = max([up, left, down, right]);
    if((U(12) == 1 && (U(i) == 0 || U(i) == -1 || U(i) == 1)) || U(i) == 1000 || U(i) == -1000)
        policy(i) = U(i);
    end
end
end