classdef CS4300_Node < handle
    % Node data structure to hold relevent data for specific node
    %   used to create tree data structure which contains the visited nodes
    %   of a wumpus world board.
    % Author:
    %   Matthew Lemon
    %   UU575787
    %   Derek Heldt-Werle
    %   UU828479
    %   Fall 2016
    %
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
            % CS4300_Node - Constructs a Node for Wumpus World Tree
            % On input:
            %   parent (CS4300_Node): parent of this node or 0 if root
            %   level (int): parent.level + 1
            %   state (1x3 vector): x, y, dir state
            %   action (int): FORWARD(1), RIGHT(2), LEFT(3)
            %   g (int): cost to get to this node
            %   h (int): heuristic of getting from here to goal state
            %   cost (int): g+h
            % On output:
            %   N (CS4300_Node): this node data object
            % Call:
            % N = CS4300_Node(0, parent_node.level+1, [1,1,0], 0, 0, 4, 4)
            %
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
            % add - adds a child to this(N) node
            % On input:
            %   N (CS4300_Node): the node to add a child to
            %   child (CS4300_Node): child we wish to add
            % Call:
            % CS4300_Node(...).add(CS4300_Node(...))
            %           
            N.children = [N.children, child];
        end
    end
    
end

