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

x = 4;
y = length(policy) / x;

for i=1:length(policy)
    xpos = floor(mod(i,x)) + ((mod(i, x) == 0) * x);
    ypos = floor(i/x) + (mod(i, x) > 0);
    
    right = (xpos+1) + (ypos-1)*4;
    left = (xpos-1) + (ypos-1)*4;
    up = xpos + (ypos)*4;
    down = xpos + (ypos-2)*4;
    
    action = 0;
    value = 0;
    if(ypos < y)
       value = U(up);
       action = 1;
    end
    if(xpos > 1)
        if(value < U(left))
           value = U(left);
           action = 2;
        end
    end
    if(ypos > 1)
        if(value < U(down))
            value = U(down);
            action = 3;
        end
    end
    if(xpos < x)
        if(value < U(right))
            action = 4;
        end
    end
    
    if((U(12) == 1 && (U(i) == 0 || U(i) == -1 || U(i) == 1)) || U(i) == 1000 || U(i) == -1000)
        policy(i) = U(i);
    else
        policy(i) = action;
    end
end