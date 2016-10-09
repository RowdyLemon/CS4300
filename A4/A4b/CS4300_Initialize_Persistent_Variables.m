function [pits, wumpus, board, KB, places, plan] = CS4300_Initialize_Persistent_Variables()
% CS4300_Initialize_Persistent_Variables - initializes persistent variables
% On output:
%   init_pits (4x4 matrix): zeroed 4x4 matrix
%   init_wumpus (4x4 matrix): zeroed 4x4 matrix
%   init_board (4x4 matrix): zeroed 4x4 matrix
%   init_loc (1x2 matrix): [1, 1] agent initial location
% Call:
%   persistent [pits, board, wumpus, loc] = CS4300_Initialize_Persistent_Variables(board);
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
KB = [];
places = [-1,-1];
plan = [];
end

