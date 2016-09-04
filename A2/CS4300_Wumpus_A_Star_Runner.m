function [] = CS4300_Wumpus_A_Star_Runner()
    trials = 1;
    
    locs = [1,1;2,1;3,1;4,1;...
        1,2;2,2;3,2;4,2;...
        1,3;2,3;3,3;4,3;...
        1,4;2,4;3,4;4,4];
    
    board = zeros(4,4);
    
    for i = 1:trials
       gold_loc = [randi(4), randi(4)];
       wump_loc = [randi(4), randi(4)];
       if gold_loc == wump_loc
           board(gold_loc(1), gold_loc(2)) = 4;
       else
           board(gold_loc(1), gold_loc(2)) = 2;
           board(wump_loc(1), wump_loc(2)) = 3;
       end
       for x = 1:4
           for y = 1:4
              if ([x,y] == gold_loc) | ([x,y] == wump_loc) | ([x,y] == [1,1])
                 continue;
              else
                  pit_chance = randi(5);
                  if pit_chance == 1
                     board(x,y) = 1; 
                  end
              end
           end
       end
       CS4300_Wumpus_A_Star1(board, [1,1,1], [gold_loc(1), gold_loc(2), 1], 'CS4300_A_Star_Man', 1);
       
    end
    
end

