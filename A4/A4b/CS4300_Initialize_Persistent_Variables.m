function [init_pits, init_wumpus, init_board, init_loc, KB] = CS4300_Initialize_Persistent_Variables()
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
init_pits = zeros(4);
init_wumpus = zeros(4);
init_board = zeros(4);
init_loc = [1,1];
KB = [];
end

