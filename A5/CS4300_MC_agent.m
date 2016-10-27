function action = CS4300_MC_agent(percept) 
% CS4300_MC_agent - Monte Carlo agent with a few informal rules 
% On input: 
%     percept (1x5 Boolean vector): percept from Wumpus world 
%       (1): stench 
%       (2): breeze 
%       (3): glitter 
%       (4): bump 
%       (5): scream 
% On output: 
%     action (int): action to take 
%       1: FORWARD 
%       2: RIGHT 
%       3: LEFT 
%       4: GRAB 
%       5: SHOOT 
%       6: CLIMB 
% Call: 
%     a = CS4300_MC_agent(percept); 
% Author:
% 	Derek Heldt-Werle
% 	UU828479
%	Matthew Lemon
%	UU575787
% 	Fall 2016
%
FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

num_trials = 1000;

persistent safe pits wumpus board have_gold have_arrow plan breezes stench
persistent agent frontier visited t

if isempty(agent)     
	t = 0;
	agent.x = 1;
	agent.y = 1;
	agent.dir = 0;
	safe = [];
	pits = -ones(4,4);
	wumpus = -ones(4,4);
    breezes = -ones(4,4);
    stench = -ones(4,4);
	board = ones(4,4);
	visited = [1,1];
	frontier = [];
	pits(4,1) = 0;
	wumpus(4,1) = 0;
	board(4,1) = 0;
	have_arrow = 1;
end

board(4 - agent.y + 1, agent.x) = 0;

if percept(3) == 1 && isempty(plan)
    [so,no] = CS4300_Wumpus_A_star(board, [agent.x, agent.y, agent.dir], [1,1,0], 'CS4300_A_star_Man');
    plan = [GRAB; so(2:end,4)];
    plan = [plan; CLIMB];
end

if isempty(plan)
    breezes(4 - agent.y + 1, agent.x) = percept(2);
    stench(4 - agent.y + 1, agent.x) = percept(1);
    [pits, wumpus] = CS4300_WP_estimates(breezes,stench, num_trials); 
    [neighbors, safe_neighbors] = CS4300_Get_Frontier_Neighbors(agent, visited, ... 
        frontier, percept, safe);
    frontier = [neighbors; frontier];
    safe = [safe_neighbors; safe];
    board = CS4300_Update_Board(safe, board);
    if ~ismember([agent.x, agent.y], visited, 'rows')
        visited = [visited; agent.x, agent.y];
    end
    [plan, frontier, safe, board, have_arrow] = CS4300_Figure_Out_Plan(board,agent,...
        frontier, safe, pits, wumpus, have_arrow);
end

action = plan(1);
if action == SHOOT && ~percept(1)
    plan(end+1) = FORWARD;
end
agent = CS4300_Perform_Action(action, agent);
plan = plan(2:end);
