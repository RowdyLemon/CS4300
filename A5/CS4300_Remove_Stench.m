function board = CS4300_Remove_Stench(b)
% CS4300_Remove_Stench - estimate pit and Wumpus likelihoods
% On input:
%   b (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
%       2: gold in room
%       3: Wupmus in room
%       4: both gold and Wumpus in room
% On output:
%   board (4x4 int array): Wumpus board with wumpus removed
%       0: nothing in room
%       1: pit in room
%       2: gold in room
%       4: both gold and Wumpus in room
% Call:
%  board = CS4300_gen_board(0.2);       
% b = CS4300_Remove_Stench(board)
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%

for i = 1:length(b)
    for j = 1:length(b)
        if b(4 - j + 1, i) == 3
            b(4 - j + 1, i) = 0;
        end
    end
end
board = b;


