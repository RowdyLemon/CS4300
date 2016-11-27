function [U,U_trace] = CS4300_MDP_value_iteration(S,A,P,R,gamma,...
eta,max_iter)
% CS4300_MDP_value_iteration - compute policy using value iteration
%   On input:
%       S (vector): states (1 to n)
%       A (vector): actions (1 to k)
%       P (nxk struct array): transition model
%         (s,a).probs (a vector with n transition probabilities
%         (from s to s_prime, given action a)
%       R (vector): state rewards
%       gamma (float): discount factor
%       eta (float): termination threshold
%       max_iter (int): max number of iterations
% On output:
%       U (vector): state utilities
%       U_trace (iterxn): trace of utility values during iteration
% Call:
%       Chapter 17 Russell and Norvig (Table p. 651)
%       [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000)
%
%       U’ = 0.7053 0.6553 0.6114 0.3879 0.7616 0 0.6600 -1.0000
%       0.8116 0.8678 0.9178 1.0000
%
%   Layout:       1
%   9 10 11 12    |
%   5 6 7 8   2 <- -> 4
%   1 2 3 4       |
%                 V
%                 3
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

U = [];
U_trace = [];
U_Prime = zeros(1,length(P(1,1).probs));
delta = 0;
U_Prime(12) = 1;
do = true;
count = 1;
while (delta >= ((eta * (1-gamma))/gamma) || do && count < max_iter)
    count = count + 1;
    U = U_Prime;
    delta = 0;    
    for s = 1:length(S)
        if(R(s) == 1000 || R(s) == -1000) %(R(12) && (R(s) == -1 || R(s) == 1 || R(s) == 0 )) || 
            U_Prime(s) = R(s);
        else
            up = dot(P(s, A(1)).probs, U);
            left = dot(P(s, A(2)).probs, U);
            down = dot(P(s, A(3)).probs, U);
            right = dot(P(s, A(4)).probs, U);
            U_Prime(s) = R(s) + gamma * max([up, left, down, right]);
        end
        if (abs(U_Prime(s) - U(s)) > delta)
            delta = abs(U_Prime(s) - U(s));
        end
    end
    U_trace(end+1).trace = U;
    do = false;
end


