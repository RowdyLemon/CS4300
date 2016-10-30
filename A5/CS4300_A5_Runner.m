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
successes = 0;
failures = 0;
mean_scores = 0;

clear(f_name);

for i=1:length(boards)
    [score,trace] = CS4300_WW1(max_steps,f_name,boards(i).board);
    scores(i).board = boards(i).board;
    scores(i).score = score;
    scores(i).trace = trace;

    clear(f_name);
    disp(i);
end

for i = 1:length(boards)
    if scores(i).score > 0
        successes = successes + 1;
    else
        failures = failures + 1;
    end
    mean_scores = mean_scores + scores(i).score;
end
disp('Successes');
disp(successes);
disp('Failures');
disp(failures);
disp('Mean Scores');
disp(mean_scores/length(boards));




