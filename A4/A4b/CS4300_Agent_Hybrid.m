function action = CS4300_Agent_Hybrid(percepts)
% CS4300_A4b - runs the agent brain
% On input:
%   percepts (1x5 Matrix): current percepts
%       - [STENCH, BREEZE, GLITTER, SCREAM, BUMP]
% On output:
%   path (matrix): path agent took through the board
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

persistent pits;
persistent wumpus;
persistent ww_board;

persistent KB;
persistent agent_location;

if(isempty(pits) || isempty(wumpus) || isempty(ww_board) || isempty(agent_location) || isempty(KB))
    [pits, wumpus, ww_board, agent_location, KB] = CS4300_Initialize_Persistent_Variables();
end

new_sentence = CS4300_Make_Percept_Sentence(percepts, agent_location);
KB = CS4300_Tell(KB, new_sentence);

if(CS4300_Ask(KB, ((x + (y-1)*4) + 80), []))
    
end


end

