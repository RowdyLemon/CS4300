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
score_values = [];
trial_score = 0;

clear(f_name);

for i=1:50
    for j=1:5
        [score,trace] = CS4300_WW1(max_steps,f_name,boards(i).board);
        trial_score = trial_score + score;
        clear(f_name);
    end
    
    scores(i).score = trial_score/5;
    scores(i).board = boards(i).board;
    score_values(end+1) = scores(i).score;
    disp(i);
    trial_score = 0;
end

for i = 1:50
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
disp(mean_scores/50);
disp('Variance');
disp(var(score_values));
disp('CI');
CI1 = mean_scores/50 - 1.645*sqrt(var(score_values)/50)
CI2 = mean_scores/50 + 1.645*sqrt(var(score_values)/50)



