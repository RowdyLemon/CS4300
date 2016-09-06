function [ children ] = CS4300_Get_Children_States( current_node )
    cs = current_node.state;
    
    FORWARD = 1;
    RIGHT = 2;
    LEFT = 3;
    
    dir = cs(3);
    
    states = java.util.ArrayList;
    
    if dir == 0
        if cs(1)+1 <= 4
           states.add([cs(1)+1, cs(2), 0, FORWARD]);
        end
        states.add([cs(1), cs(2), 1, LEFT]);
        states.add([cs(1), cs(2), 3, RIGHT]);
    elseif dir == 1
        if cs(2)+1 <= 4
            states.add([cs(1), cs(2)+1, 1, FORWARD]);
        end
        states.add([cs(1), cs(2), 2, LEFT]);
        states.add([cs(1), cs(2), 0, RIGHT]);
    elseif dir == 2
        if cs(1)-1 >= 1
           states.add([cs(1)-1, cs(2), 2, FORWARD]); 
        end
        states.add([cs(1), cs(2), 3, LEFT]);
        states.add([cs(1), cs(2), 1, RIGHT]);
    elseif dir == 3
        if cs(2)-1 >= 1
           states.add([cs(1), cs(2)-1, 3, FORWARD]); 
        end
        states.add([cs(1), cs(2), 0, LEFT]);
        states.add([cs(1), cs(2), 2, RIGHT]);
    end
    
    children = states;           
end

