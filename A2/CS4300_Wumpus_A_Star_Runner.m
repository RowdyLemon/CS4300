function [] = CS4300_Wumpus_A_Star_Runner()

    PIT = 1;
    GOLD = 2;
    WUMPUS = 3;
    BOTH = 4;
    
    trials = 1;  
    board = zeros(4,4);
    
    for i = 1:trials
       gold_loc = [randi(4), randi(4)];
       wump_loc = [randi(4), randi(4)];
       while wump_loc == [1,1]
           wump_loc = [randi(4), randi(4)];
       end
       
       if gold_loc == wump_loc
           board(gold_loc(1), gold_loc(2)) = BOTH;
       else
           board(gold_loc(1), gold_loc(2)) = GOLD;
           board(wump_loc(1), wump_loc(2)) = WUMPUS;
       end
       for x = 1:4
           for y = 1:4
              if ([x,y] == gold_loc) | ([x,y] == wump_loc) | ([x,y] == [1,1])
                 continue;
              else
                  pit_chance = randi(5);
                  if pit_chance == 1
                     board(x,y) = PIT; 
                  end
              end
           end
       end
       [so, no] = CS4300_Wumpus_A_star1(board, [1,1,0], [gold_loc(1), gold_loc(2), 1], 'CS4300_A_Star_Man', 1);
        
       disp(board);
       disp(so);
       disp(no);

    end 
end

