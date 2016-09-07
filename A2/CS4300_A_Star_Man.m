function [ distance ] = CS4300_A_Star_Man( current_state, goal_state )
% CS4300_A_Star_Man - Manhattan Heuristic Function
% On input:
%   current_state (1x3 vector): x, y, dir state
%   goal_state (1x3 vector): x, y, dir state
% On output:
%   distance (int): heuristic cost of getting from current state to goal
%   state
% Call:
% [distance] = CS4300_A_Star_Man([1,1,0], [2,2,0])
% distance = 2
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
    distance = abs(goal_state(1) - current_state(1)) + abs(goal_state(2) - current_state(2));
end

