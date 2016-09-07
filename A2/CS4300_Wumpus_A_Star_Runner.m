function [] = CS4300_Wumpus_A_Star_Runner()

    PIT = 1;
    GOLD = 2;
    WUMPUS = 3;
    BOTH = 4;
    
    trials = 2000;  
    board = zeros(4,4);
    
    number_nodes_1 = zeros(1, trials);
    number_nodes_2 = zeros(1, trials);
    
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
       
       [so1, no1] = CS4300_Wumpus_A_star1(board, [1,1,0], [gold_loc(1), gold_loc(2), 1], 'CS4300_A_Star_Man', 1);
       
       number_nodes_1(i) = length(no1);
       
       [so2, no2] = CS4300_Wumpus_A_star1(board, [1,1,0], [gold_loc(1), gold_loc(2), 1], 'CS4300_A_Star_Man', 2);
        
       number_nodes_2(i) = length(no2);
       
%        disp(board);
%        disp(so);
%        disp(no);
       
%        for i=1:length(no)
%            space = '';
%            for j=1:no(i).level
%               space = [space, ' '];
%            end
%            fprintf('%s\n', [space, mat2str(no(i).state)]);
%        end

    end
    
    mean1 = mean(number_nodes_1(1,:));
    var1 = var(number_nodes_1(1,:));
    mean2 = mean(number_nodes_2(1,:));
    var2 = var(number_nodes_2(1,:));
    CI1 = mean1 - 1.645*sqrt(var1/trials);
    CI1 = [CI1, mean1 + 1.645*sqrt(var1/trials)];
    CI2 = mean2 - 1.645*sqrt(var2/trials);
    CI2 = [CI2, mean2 - 1.645*sqrt(var2/trials)];
    
    disp('insertion type 1');
    disp(['mean: ', num2str(mean1)]);
    disp(['var: ', num2str(var1)]);
    disp(['CI: ', num2str(CI1)]);
    
    disp('insertion type 2');
    disp(['mean: ', num2str(mean2)]);
    disp(['var: ', num2str(var2)]);
    disp(['CI: ', num2str(CI2)]);
end

