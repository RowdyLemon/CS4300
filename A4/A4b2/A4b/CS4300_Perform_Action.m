function agent = CS4300_Perform_Action( action, old_agent )
% CS4300_Perform_Action - Updates agent location based on action
% On input:
%   action (int): value of action to perform
%   old_agent (1x3 array):  array of agent location information
% Call:
%   action = 1;
%   old_agent = [1,1,0];
%   CS4300_Perform_Action(action, old_agent);
% FORWARD = 1;
% ROTATE_RIGHT = 2;
% ROTATE_LEFT = 3;
% GRAB = 4;
% SHOOT = 5;
% CLIMB = 6;
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
old_agent_x = old_agent(1);
old_agent_y = old_agent(2);
old_agent_dir = old_agent(3);

if(old_agent_dir == 0)
    switch(action)
        case 1
            agent = [old_agent_x + 1, old_agent_y, old_agent_dir];
        case 2
            agent = [old_agent_x, old_agent_y, 3];
        case 3
            agent = [old_agent_x, old_agent_y, 1];
        otherwise
            agent = old_agent;
    end
end

if(old_agent_dir == 1)
    switch(action)
        case 1
            agent = [old_agent_x, old_agent_y+1, old_agent_dir];
        case 2
            agent = [old_agent_x, old_agent_y, 0];
        case 3
            agent = [old_agent_x, old_agent_y, 2];
        otherwise
            agent = old_agent;
    end
end

if(old_agent_dir == 2)
    switch(action)
        case 1
            agent = [old_agent_x - 1, old_agent_y, old_agent_dir];
        case 2
            agent = [old_agent_x, old_agent_y, 1];
        case 3
            agent = [old_agent_x, old_agent_y, 3];
        otherwise
            agent = old_agent;
    end
end

if(old_agent_dir == 3)
    switch(action)
        case 1
            agent = [old_agent_x, old_agent_y - 1, old_agent_dir];
        case 2
            agent = [old_agent_x, old_agent_y, 2];
        case 3
            agent = [old_agent_x, old_agent_y, 0];
        otherwise
            agent = old_agent;
    end
end

end