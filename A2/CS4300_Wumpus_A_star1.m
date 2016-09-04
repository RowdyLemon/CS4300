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
% (i).parent (int): index of node�s parent
% (i).level (int): level of node in search tree
% (i).state (1x3 vector): [x,y,dir] state represented by node
% (i).action (int): action along edge from parent to node
% (i).g (int): path length from root to node
% (i).h (float): heuristic value (estimate from node to goal)
% (i).cost (float): g + h (called f value in text)
% (i).children (1xk vector): list of node�s children
% Call:
%[so,no] = CS4300_Wumpus_A_star1([0,0,0,0;0,0,0,1;0,2,1,3;0,0,0,0],...
% [1,1,0],[2,2,1],�CS4300_A_star_Man�,1)
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

    
    priority_queue = java.util.PriorityQueue;
    
    visited = java.util.HashSet;
    
    tree;
    
    disp(board);
    disp(initial_state);
    disp(goal_state);
    
    priority_queue.add(initial_state);
    
    while ~priority_queue.isEmpty()
        
        %get the fucking neighbors of current state
        current_state = priority_queue.poll()

        visited.add([current_state(1), current_state(2)]);
        neighbors = Get_Neighbors(current_state);
        for i = 1:Length(neighbors)
           if board(neighbors(i, 1), neighbors(i, 2)) == BOTH
               % return a bunch of failed shit
           end
           if board(neighbors(i, 1), neighbors(i, 2)) == WUMPUS | board(neighbors(i, 1), neighbors(i, 2)) == PIT
               continue;
           end
           if ~visited.contains([neighbors(i,1),neighbors(i,2)])
                priority_queue.add(neighbors(i));
           end
        end
        parent_node = Node();
    end
end
