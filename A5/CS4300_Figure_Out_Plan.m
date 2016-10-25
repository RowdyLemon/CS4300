function [plan, frontier, safe, board] = CS4300_Figure_Out_Plan(b, agent, ...
    old_frontier, old_safe, pits, wumpus)
% CS4300_Figure_Out_Plan - returns plan to execute
% On input:
%   b (4x4 vector): current knowledge of board
%   agent (agent struct): location of agent
%   old_frontier (nx2): x, y locations of frontier cells
%   old_safe (nx2): x, y locations of safe cells
%   pits (4x4 matrix): percentage of chances of pits
%   wumpus (4x4 matrix): percentage of chances of wumpus
% On output:
%   plan (Array): actions to perform
%   frontier (nx2 matrix): x, y coords of places to visit
%   safe (nx2 matrix): x, y coords of safe places to visit
%   board (4x4 matrix): agents perceived state of the wumpus world 
% Call:
%   pits = -ones(4);
%   wumpus = -ones(4);
%   agent.x = 1;
%   agent.y = 1;
%   board = ones(4);
%   agent = [1,1,0];
%   old_frontier = [];
%   old_safe = [];
%   [plan, frontier, safe, board] = CS4300_Update_Boards(board, agent, old_frontier,
%   old_safe, pits, wumpus);
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%

if ~isempty(safe)
    [so,no] = CS4300_Wumpus_A_star(board, agent, safe, 'CS4300_A_star_Man');
    plan = so(2:end,4);
    return;
end



end

