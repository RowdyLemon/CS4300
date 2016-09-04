function [ distance ] = CS4300_A_Star_Man( current_state, goal_state )
    distance = abs(goal_state.x - current_state.x) + abs(goal_state.y - current_state.y);
end

