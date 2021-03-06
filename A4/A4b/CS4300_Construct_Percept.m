function percept = CS4300_Construct_Percept( board, location )
% CS4300_Constrcut_Percept - Updates Knowledge base
% On input:
%   board (4x4 matrix): Board values
% On output:
%   percept (1x5 matrix): Describes current location
% Call:
%   board = [0,0,0,0;0,0,0,0;0,0,0,0;0,0,0,0;];
%   x = 1;
%   y = 1;
%   CS4300_Construct_Percept(board, x, y);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%
percept = [0,0,0,0,0];
x = location(1);
y = location(2);
% board  = CS4300_Fix_Board(board);

if (x < 4)
    next_x_loc = (x + 1);
    if(board(next_x_loc, y) == 1)
        percept(2) = 1;
    end
    if(board(next_x_loc, y) == 3)
        percept(1) = 1;
    end
end

if (x > 1)
    prev_x_loc = (x - 1);
    if(board(prev_x_loc, y) == 1)
        percept(2) = 1;
    end
    if(board(prev_x_loc, y) == 3)
        percept(1) = 1;
    end
end

if (y < 4)
    next_y_loc = (y + 1);
    if(board(x, next_y_loc) == 1)
        percept(2) = 1;
    end
    if(board(x, next_y_loc) == 3)
        percept(1) = 1;
    end
end

if (y > 1)
    prev_y_loc = (y - 1);
    if(board(x, prev_y_loc) == 1)
        percept(2) = 1;
    end
    if(board(x, prev_y_loc) == 3)
        percept(1) = 1;
    end
end
if(board(x,y) == 2)
    percept(3) = 1;
end

end

