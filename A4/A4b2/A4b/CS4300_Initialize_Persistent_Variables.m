function [pits, wumpus, board, agent, KB, places, plan, visited, vars] = CS4300_Initialize_Persistent_Variables()
% CS4300_Initialize_Persistent_Variables - initializes persistent variables
% On output:
%   pits (4x4 matrix): 4x4 matrix initialized to negative ones everywhere
%   wumpus (4x4 matrix): 4x4 matrix initialized to negative ones everywhere
%   board (4x4 matrix): 4x4 wumpus world initialized with pits everywhere
%   agent (1x3 matrix): [1, 1, 0] agent initial location
%   KB (struct): initialized with rules of wumpus world
%   places (nx2 matrix): places we want to visit
%   plan (nx1 matrix): plan of actions to perform
%   visited (nx2 matrix): places we have visited already
% Call:
%   persistent [pits, board, wumpus, agent, kb, places, plan, visited] = CS4300_Initialize_Persistent_Variables(board);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
pits = -ones(4);
wumpus = -ones(4);
board = ones(4);
agent = [1,1,0];
KB = CS4300_Initialize_KB();
places = [-1,-1];
plan = [];
visited = [-1,-1];
vars = [];
for i = 1:length(KB)
  vars = [vars, KB(i).clauses];
end
vars = unique(vars);
end