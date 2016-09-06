function [solution,nodes] = CS4300_Wumpus_A_star1(board,initial_state,goal_state,h_name,option)
% CS4300_Wumpus_A_star1 - A* algorithm for Wumpus world
% On input:
% board (4x4 int array): Wumpus board layout
% 0: means empty cell
% 1: means a pit in cell
% 2: means gold (only) in cell
% 3: means Wumpus (only) in cell
% 4: means gold and Wumpus in cell
% initial_state (1x3 vector): x,y,dir state
% goal_state (1x3 vector): x,y,dir state
% h_name (string): name of heuristic function
% option (int): picks insertion strategy for equal cost states
% 1: insert state before equal or greater than states
% 2: insert after equal or less than states
% On output:
% solution (nx4 array): solution sequence of state and the action
% nodes (search tree data structure): search tree
% (i).parent (int): index of node’s parent
% (i).level (int): level of node in search tree
% (i).state (1x3 vector): [x,y,dir] state represented by node
% (i).action (int): action along edge from parent to node
% (i).g (int): path length from root to node
% (i).h (float): heuristic value (estimate from node to goal)
% (i).cost (float): g + h (called f value in text)
% (i).children (1xk vector): list of node’s children
% Call:
%[so,no] = CS4300_Wumpus_A_star1([0,0,0,0;0,0,0,1;0,2,1,3;0,0,0,0],...
% [1,1,0],[2,2,1],’CS4300_A_star_Man’,1)
% so =
% 1 1 0 0
% 2 1 0 1
% 2 1 1 3
% 2 2 1 1
%
% no = 1x9 struct array with fields:
% parent
% level
% state
% action
% cost
% g
% h
% children
% Author:
% T. Henderson
% UU
% Summer 2016
%
    
    EMPTY = 0;
    PIT = 1;
    GOLD = 2;
    WUMPUS = 3;
    BOTH = 4;
    
    RIGHT = 0;
    UP = 1;
    LEFT = 2;
    DOWN = 3;
    
    FORWARD = 1;
    ROTATE_RIGHT = 2;
    ROTATE_LEFT = 3;

    
    priority_queue = PriorityQueue();
    visited = java.util.HashSet;
    
    disp(board);
    
    % Build root node (parent, level, state, action, g, h, cost)
    g = 0;
    h = CS4300_A_Star_Man(initial_state, goal_state);
    root = Node(0, 0, initial_state, 0, g, h, g+h);
    
    priority_queue.add(root,1);
    
    while length(priority_queue.nodes) > 0
        disp('end');
        % get current state and mark it as visited
        current_node = priority_queue.remove();
        visited.add(mat2str(current_node.state));
        
        % check if wumpus and gold
        if board(current_node.state(1), current_node.state(2)) == BOTH
            disp('both together, cant solve');
            break; % no solution 
        end
        
        % check if arrived at goal
        disp(current_node.state);
        disp(goal_state);
        if current_node.state == goal_state
            disp('we got the gold');
           break; % we win 
        end
        
        % check if on a hole or wumpus
        if board(current_node.state(1), current_node.state(2)) == PIT | board(current_node.state(1), current_node.state(2)) == WUMPUS
            disp('we hit a hole or a wumpus');
            continue; 
        end
        
        % get child states, build nodes, and add them to queue
        children = Get_Children_States(current_node);
        for i=1:children.size
            g = current_node.g+1;
            child_state = children.get(i-1);
            h = CS4300_A_Star_Man(child_state, goal_state);
            child = Node(current_node, current_node.level+1, reshape(child_state(1:3),[1,3]), child_state(4), g, h, g+h);
            if ~visited.contains(mat2str(child.state))
                priority_queue.add(child,1);
            end
        end
        
    end
end
