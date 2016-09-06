function [ distance ] = CS4300_A_Star_Man( current_state, goal_state )
    distance = abs(goal_state(1) - current_state(1)) + abs(goal_state(2) - current_state(2));
end

