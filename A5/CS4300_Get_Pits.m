function pits = CS4300_Get_Pits(board)
% CS4300_Get_Pits - add valid pit board with only zeros and ones
% On input:
%   board (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
%       2: gold in room
%       3: Wupmus in room
%       4: both gold and Wumpus in room
% On output:
%   pits (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
% Call:
%	  board = CS4300_gen_board(0.2);
%     pits = CS4300_Get_Pits(board);
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%
pits = zeros(4,4);
for i = 1:length(board)
    for j = 1:length(board)
        if board(4 - j + 1, i) == 1
            pits(4 - j + 1, i) = 1;
        end
    end
end