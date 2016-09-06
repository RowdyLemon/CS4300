classdef CS4300_Node < handle
    
    properties
        parent;
        level;
        state;
        action;
        g;
        h;
        cost;
        children;
    end
    
    methods
        function N = CS4300_Node(parent, level, state, action, g, h, cost)
            N.parent = parent;
            N.level = level;
            N.state = state;
            N.action = action;
            N.g = g;
            N.h = h;
            N.cost = cost;
            N.children = [];
        end
        function add(N, child)
           N.children = [N.children, child];
        end
    end
    
end

