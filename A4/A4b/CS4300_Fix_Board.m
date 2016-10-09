function [ fixed_board ] = CS4300_Fix_Board( board )
% CS4300_Fix_Board - change board to look right
% On input:
%   board (4x4 matrix): human readable board with 1,1 in bottom left
% On output:
%   fixed_board (4x4 matrix): machine readable board with 1,1 in top left
% Call:
% board = CS4300_Fix_Board(board)
% Author
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%
    c1 = reshape(board(1, :), [4 1]);
    c2 = reshape(board(2, :), [4 1]);
    c3 = reshape(board(3, :), [4 1]);
    c4 = reshape(board(4, :), [4 1]);
    
    fixed_board = [c4, c3, c2, c1];
end

