function action = CS4300_Agent_Hybrid(percepts, agent)
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
SHOOT = 4;
GRAB = 5;
CLIMB = 6;

persistent pits;
persistent wumpus;
persistent board;
persistent KB;
persistent places;
persistent plan;

if(isempty(pits) || isempty(wumpus) || isempty(board) || isempty(KB) || isempty(places) || isempty(plan))
  [pits, wumpus, board, KB, places, plan] = CS4300_Initialize_Persistent_Variables();
end

sentence = CS4300_Make_Percept_Sentence(percepts, agent);
KB = CS4300_Tell(KB, sentence);

if(CS4300_Ask(KB, CS4300_Map_ID(5, agent(1:2)), []) == 1)
  plan = GRAB;
  b = CS4300_Fix_Board(board);
  b = CS4300_Fix_Board(b);
  b = CS4300_Fix_Board(b);
  [so, no] = CS4300_Wumpus_A_star(b, agent, [1,1,0], 'CS4300_A_Star_Man');
  plan = [plan, so(:,4)];
  plan = [plan, CLIMB];
  action = plan(1);
  plan = plan(2:end);
  return;
end

if(~isempty(plan))
  action = plan(1);
  plan = plan(2:end);
  return; 
else
  [pits, wumpus, board] = CS4300_Update_Boards(pits, wumpus, board, agent, KB);
  [plan, places] = CS4300_Figure_Out_Plan(board, agent, places);
  action = plan(1);
  plan = plan(2:end);
  return;
end

end

