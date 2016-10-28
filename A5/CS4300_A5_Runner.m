function [scores,traces] = CS4300_A5_Runner(max_steps,f_name, boards)
% CS4300_CS4300_A5_Runner - Wumpus World Monte Cristo simulation
% On input:
%     max_steps (int): maximum number of simulation steps
%     f_name (string): name of agent function
% On output:
%     score (int): agent score on game
%     trace (nx3 int array): trace of state
%       (i,1): x location
%       (i,2): y location
%       (i,3): action selected at time i
% Call:
%     [s,t] = CS4300_WW3(50,'CS4300_hybrid_agent');
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

traces = [];
scores = [];

% agent.x = 1;
% agent.y = 1;
% agent.alive = 1;  
% agent.gold = 0;  % grabbed gold in same room
% agent.dir = 0;  % facing right
% agent.succeed = 0;  % has gold and climbed out
% agent.climbed = 0; % climbed out
% 
% clear(f_name);

for i=1:length(boards)
    clear(f_name);
    [score,trace] = CS4300_WW1(max_steps,f_name,boards(i).board);
    scores(i).board = boards(i).board;
    scores(i).score = score;
    scores(i).trace = trace;

    clear(f_name);
end

