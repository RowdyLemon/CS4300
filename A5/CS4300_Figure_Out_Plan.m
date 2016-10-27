function [plan, frontier, safe, board, have_arrow] = CS4300_Figure_Out_Plan(b, agent, ...
    old_frontier, old_safe, pits, wumpus, arrow)
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
safe = old_safe;
frontier = old_frontier;
have_arrow = arrow;
if ~isempty(old_safe)
    [so,no] = CS4300_Wumpus_A_star(b, [agent.x, agent.y, agent.dir], [old_safe(1,:),0], 'CS4300_A_star_Man');
    plan = so(2:end,4);
    safe = old_safe(2:end,:);
else
    wumpus_xy = old_frontier(1,:);
    pit_xy = old_frontier(1,:);
    no_wumpus_flag = 0;
    
    for i = 2:length(old_frontier)
        if wumpus(4 - old_frontier(i,2) + 1, old_frontier(i,1)) > wumpus(4 - wumpus_xy(2) + 1, wumpus_xy(1))
            wumpus_xy = old_frontier(i,:);
        end
        if pits(4 - old_frontier(i,2) + 1) < pits(4 - pit_xy(2) + 1, pit_xy(1))
            pit_xy = old_frontier(i,:);
        end
    end
    if wumpus(4 - wumpus_xy(2) + 1, wumpus_xy(1)) == 0 || ~have_arrow
        b(4 - pit_xy(2) + 1, pit_xy(1)) = 0;
        [so,no] = CS4300_Wumpus_A_star(b, [agent.x, agent.y, agent.dir], ...
            [pit_xy,0], 'CS4300_A_star_Man');
         plan = so(2:end,4);
         no_wumpus_flag = 1;
    elseif have_arrow
        b(4 - wumpus_xy(2) + 1, wumpus_xy(1)) = 0;
        [so,no] = CS4300_Wumpus_A_star(b, [agent.x, agent.y, agent.dir], ...
            [wumpus_xy,0], 'CS4300_A_star_Man');
         plan = so(2:end,4);
         plan(end) = 5;
         plan(end+1) = 1;
         have_arrow = 0;
    end
    if no_wumpus_flag
        for i = 1:length(old_frontier)
            if pit_xy == old_frontier(i)
                old_frontier(i) = [];
            end
        end
    else
        for i = 1:length(old_frontier)
            if wumpus_xy == old_frontier(i)
                old_frontier(i) = [];
            end
        end   
    end
    frontier = old_frontier;
end
board = b;
end

