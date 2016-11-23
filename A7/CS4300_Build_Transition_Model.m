function p = CS4300_Build_Transition_Model (x, y)
% CS4300_Build_Transition_Model - Builds transition model
% On input:
%       x (int) : X dimension of board
%       y (int) : Y dimension of board
%
% On output:
%      p (nxk struct array): Transition Model
% Call:
%       p = CS4300_Build_Transition_Model(4,4);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
xpos = floor(mod(xpos,x) + ((mod(xpos, x) == 0) * x))
o = floor(ypos/y +(mod(ypos, y) > 0))
arrayPos = xpos + (ypos - 1) * x;

p = [];
for i = 1:x*y
    xpos = floor(mod(i,x) + ((mod(i, x) == 0) * x));
    ypos = floor(i/y +(mod(i, y) > 0));
    arrayPos = xpos + (ypos - 1) * x;

    for k = 1:4
        p(i,k).probs = [];
        
        if (k)
            if (ypos == y)
                p(i,k).probs(arraypos) = .8;
            else
                p(i,k).probs(
            end
            
        end
        for j = 1:x*y
            xpos_neighbor = floor(mod(j,x) + ((mod(j, x) == 0) * x));
            ypos_neighbor = floor(j/y +(mod(j, y) > 0));
            
            if (
            
            arrayPos = xpos + (ypos - 1) * x;
            
            p(i,k).probs = [p(i,k).probs, 
        end
    end
end
end

