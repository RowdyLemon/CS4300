function CS4300_Agent_Runner(board)
% CS4300_Agent_Runner - runs the agent on a given board
% On input:
%   board (4x4 matrix): wumpus world board
% Call:
%   board = [0,0,0,0; 1,0,1,0; 0,2,3,0; 0,0,0,0];
%   CS4300_Agent_Runner(board);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

board = CS4300_Fix_Board(board);

died = false;
success = false;

agent = [1,1,0];
done = false;

while ~done
  percept = CS4300_Construct_Percept(board, agent(1:2)); 
  action = CS4300_Agent_Hybrid(percept, agent);
  agent = CS4300_Perform_Action(action, agent);
  if(board(agent(1), agent(2)) == 1 || board(agent(1), agent(2)) == 3 || board(agent(1), agent(2)) == 4)
     done = true;
     died = true;
     continue;
  end
  if(action == 6)
    done = true;
    success = true;
  end
end


end

