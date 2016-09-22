function contains = CS4300_Contains(arc, queue)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
contains = false;
for i = 1:length(queue)
   if isequal(queue(i,:), arc)
      contains = true;
      break;
   end
end

end

