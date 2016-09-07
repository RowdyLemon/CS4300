function [ children ] = CS4300_Get_Children_States( current_state )
% CS4300_Get_Children_States - Returns the possible child states of the
% current node
% On input:
%   current_state (1x3 vector): x, y, dir state of current node
% On output:
%   children (3x4 vector): x, y, dir, action state of child states
% Call:
% [children] = CS4300_Get_Children_states([1,1,0])
% children =
%   2   1   0   1
%   1   1   1   3
%   1   1   1   3
% Author
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
    FORWARD = 1;
    RIGHT = 2;
    LEFT = 3;
    
    dir = current_state(3);
    states = [];
    
    if dir == 0
        if current_state(1)+1 <= 4
           states = [states;...
               [current_state(1)+1, current_state(2), 0, FORWARD]];
        end
        states = [states;...
            [current_state(1:2), 3, RIGHT];...
            [current_state(1:2), 1, LEFT]];
    elseif dir == 1
        if current_state(2)+1 <= 4
            states = [states;...
                [current_state(1), current_state(2)+1, 1, FORWARD]];
        end
        states = [states;...
            [current_state(1:2), 2, LEFT];...
            [current_state(1:2), 0, RIGHT]];
    elseif dir == 2
        if current_state(1)-1 >= 1
           states = [states;...
               [current_state(1)-1, current_state(2), 2, FORWARD]]; 
        end
        states = [states;...
            [current_state(1:2), 3, LEFT];...
            [current_state(1:2), 1, RIGHT]];
    elseif dir == 3
        if current_state(2)-1 >= 1
           states = [states;...
               [current_state(1), current_state(2)-1, 3, FORWARD]]; 
        end
        states = [states;...
            [current_state(1:2), 0, LEFT];...
            [current_state(1:2), 2, RIGHT]];
    end
    
    children = states;           
end

