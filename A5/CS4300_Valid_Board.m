function valid = CS4300_Valid_Board(board, breeze, stench)
% CS4300_Valid_Board - check that generated board fits known breeze and stench knowledge
% On input:
%   board (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
%       2: gold in room
%       3: Wupmus in room
%       4: both gold and Wumpus in room
% 	breeze (4x4 Boolean array): presence of breeze percept at cell
% 		-1: no knowledge
%		 0: no breeze detected
% 		1: breeze detected
% 	stench (4x4 Boolean array): presence of stench in cell
% 		-1: no knowledge
% 		0: no stench detected
% 		1: stench detected
% On output:
%   valid (int): valid board based on current knowledge of breezes and stench
% Call:
%	  board = CS4300_gen_board(0.2);
%	  stench = -ones(4,4);
%	  breeze = -ones(4,4);
%     valid = CS4300_Valid_Board(board, breeze, stench);
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%

valid = 1;

for x = 1:length(board)
	for y = 1:length(board)
        agent.x = x;
        agent.y = y;
        percept = CS4300_get_percept(board, agent, 0, 0);
		if stench(4-y+1,x) ~= -1 && percept(1) ~= stench(4-y+1,x)
			valid = 0;
			return;
		end
		if (breeze(4-y+1,x) ~= -1 && percept(2) ~= breeze(4-y+1,x)) ...
            || (breeze(4-y+1,x) ~= -1 && board(4-y+1,x) == 1)
			valid = 0;
			return;
		end
	end
end
