function m = DataGrabber( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
scores = [];
board3 = [0,0,0,0;...
    0,0,0,0;...
    3,2,0,0;...
    0,1,0,0];
clear('CS4300_Agent_Hybrid');
for i=1:30
    [score,trace] = CS4300_WW1(100,'CS4300_Agent_Hybrid',board3);
    disp(score);
    scores(end+1) = score;
    clear('CS4300_Agent_Hybrid');
end
m = mean(scores);
