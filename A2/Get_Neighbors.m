function [ neighbors ] = Get_Neighbors( current_state )
   neighbors = [];
   x = current_state(1);
   y = current_state(2);

   if x > 1
       neighbors = [neighbors, [x-1, y, 3]];
   end
   if x < 4
       neighbors = [neighbors, [x+1, y, 1]];
   end
   if y < 4
       neighbors = [neighbors, [x, y+1, 2]];
   end
   if y > 1
       neighbors = [neighbors, [x, y-1, 4]];
   end
end

