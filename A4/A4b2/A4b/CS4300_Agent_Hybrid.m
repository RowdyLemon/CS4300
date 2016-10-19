function action = CS4300_Agent_Hybrid(percept)
% CS4300_A4b - runs the agent brain
% On input:
%   percepts (1x5 Matrix): current percepts
%       - [STENCH, BREEZE, GLITTER, SCREAM, BUMP]
% On output:
%   action (matrix): path agent took through the board
% Call:
%   board = [0,0,0,0;1,2,0,0;0,0,0,0;0,0,3,0]
%   path_taken = CS4300_A4b(board);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
SHOOT = 5;
GRAB = 4;
CLIMB = 6;

persistent pits;
persistent wumpus;
persistent board;
persistent agent;
persistent KB;
persistent places;
persistent plan;
persistent visited;
persistent vars;

if(isempty(pits))
  [pits, wumpus, board, agent, KB, places, plan, visited, vars]...
      = CS4300_Initialize_Persistent_Variables();
end

% Create sentence based on percepts and update KB and vars
sentence = CS4300_Make_Percept_Sentence(percept, agent(1:2));
KB = CS4300_Tell(KB, sentence);
vars = CS4300_Update_Vars(sentence, vars);

% Check if we have found the gold
if(CS4300_Ask(KB, CS4300_Map_ID(5, agent(1:2)), vars)==1 && isempty(plan))
  plan = GRAB;
  [so,no] = CS4300_Wumpus_A_star(board, agent, [1,1,0], 'CS4300_A_star_Man');
  plan = [plan; so(2:end,4)];
  plan = [plan; CLIMB];
end

% If we dont have a plan make one
if(isempty(plan))
  [pits, wumpus, board]...
      = CS4300_Update_Boards(pits, wumpus, board, agent, KB, vars);
  [plan, places, visited, board]...
      = CS4300_Figure_Out_Plan(board, agent, places, visited);
end

action = plan(1);
plan = plan(2:end);

agent = CS4300_Perform_Action(action, agent);

end

