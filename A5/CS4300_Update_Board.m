function b = CS4300_Update_Board( safe, board )
% CS4300_Update_Board - Updates known safe places on board
% On input: 
%     safe (nx2): safe cells
%     board (4x4 vector): current knowledge of wumpus world
% On output: 
%     board (4x4 vector): updated with safe cells
% Call: 
%     board = ones(4,4);
%     safe = [1,2];
%     b = CS4300_Update_Board(safe, board); 
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%
b = board;
for i = 1:size(safe, 1)
    b(4 - safe(i,2) + 1,safe(i,1)) = 0;
end

