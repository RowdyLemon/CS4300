classdef PriorityQueue < handle
    
    properties
        nodes;
    end
    
    methods
        function PriorityQ = PriorityQueue()
            PriorityQ.nodes = Node.empty;
        end
        
        function add(PQ, node, insertion_type)
            new_nodes = Node.empty;
            inserted = 0;
            if length(PQ.nodes) == 0
               new_nodes(1) = node;
            end
            for i=1:length(PQ.nodes)
                if insertion_type == 1
                    if node.h <= PQ.nodes(i).h && inserted == 0
                        inserted = 1;
                        new_nodes(i) = node;
                    end
                    new_nodes(i+inserted) = PQ.nodes(i);
                end
                if insertion_type == 2
                    if node.cost > PQ.nodes(i).cost && inserted == 0
                        inserted = 1;
                        new_nodes(i) = node;
                    end
                    new_nodes(i+inserted) = PQ.nodes(i);
                end
                if i == length(PQ.nodes) && inserted == 0
                    new_nodes(i+1) = node;
                end
            end
            PQ.nodes = new_nodes;
        end
        
        function node = remove(PQ)
            node = PQ.nodes(1);
            PQ.nodes = PQ.nodes(2:end);
        end
        
        function e = empty(PQ)
            if length(PQ.nodes) > 0
                e = true;
            else
                e = false;
            end
        end
    end
    
end

