function utilities = CS4300_Policy_Evaluation(pi, U, S, A, P, R, gamma, k)
% CS4300_Policy_Evaluation - evaluates the utilities
% on input:
%   pi (vector): Policy vector
%   U (vector): Utilities 
%   S (vector): states
%   A (vector): actions
%   P (nxk struct array): transition model
%   R (vector): Rewards
%   k (int): number of iterations
% on output:
%   utilities (vector): utilities
% call:
%   utilities = CS4300_Policy_Evaluation(pi, U, S, A, P)
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

Uprime = U;

for i=1:k
    for s=1:length(S)
        if(R(s) == median(R))
            Uprime(s) = R(s)+ gamma * dot(P(s, pi(s)).probs, U);
        end
    end
    U = Uprime;
end
utilities = U;
end

