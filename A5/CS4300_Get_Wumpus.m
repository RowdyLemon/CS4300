function wumpus = CS4300_Get_Wumpus(board)
% CS4300_Get_Wumpus - add valid pit board with only zeros and ones
% On input:
%   board (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
%       2: gold in room
%       3: Wupmus in room
%       4: both gold and Wumpus in room
% On output:
%   wumpus (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
% Call:
%	  board = CS4300_gen_board(0.2);
%     wumpus = CS4300_Get_Wumpus(board);
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%
wumpus = zeros(4,4);
for i = 1:length(board)
    for j = 1:length(board)
        if board(4 - i + 1, j) == 3 || board(4 - i + 1, j) == 4
            wumpus(4 - i + 1, j) = 1;
        end
    end
end
        
        
        



