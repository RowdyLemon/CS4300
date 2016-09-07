function [ solution ] = CS4300_Nodes_In_Search_Tree( )
% CS4300_Nodes_In_Search_Tree - finds the number of nodes in search tree
% On output:
%   solution (4x4 matrix): {[nodes in tree 1, nodes in tree 2]}
% Call:
% solution = CS4300_Nodes_Search_tree()
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%
    for i=1:4
        for j=1:4
            board = zeros(4);
            board(5-i, j) = 2;
            goal = [i, j, 0];
            [so1, no1] = CS4300_Wumpus_A_star1(board, [1,1,0], goal, 'CS4300_A_Star_Man', 1);
            [so2, no2] = CS4300_Wumpus_A_star1(board, [1,1,0], goal, 'CS4300_A_Star_Man', 2);
            solution(5-i, 5-j) = {[length(no1), length(no2)]};
        end
    end
    c1 = reshape(solution(1, :), [4 1]);
    c2 = reshape(solution(2, :), [4 1]);
    c3 = reshape(solution(3, :), [4 1]);
    c4 = reshape(solution(4, :), [4 1]);
    solution = [c4, c3, c2, c1];
end

