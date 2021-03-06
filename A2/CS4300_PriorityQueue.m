classdef CS4300_PriorityQueue < handle
    % Priority Queue data structure to hold frontier nodes
    %   holds nodes and adds nodes in a specific order based on cost value
    %   of each node
    % Author:
    %   Matthew Lemon
    %   UU575787
    %   Derek Heldt-Werle
    %   UU828479
    %   Fall 2016
    %
    properties
        nodes;
    end
    
    methods
        function PriorityQ = CS4300_PriorityQueue()
            % CS4300_PriorityQueue - creates an empty priority queue
            % On output:
            %   PriorityQ (CS4300_PriorityQueue): an empty node priority
            %   queue
            % Call:
            % q = CS4300_PriorityQueue()
            % 
            PriorityQ.nodes = CS4300_Node.empty;
        end
        
        function add(PQ, node, insertion_type)
            % add - adds a node to the priority queue
            % On input:
            %   PQ (CS4300_PriorityQueue): queue to add node to
            %   node (CS4300_Node): node to add
            %   insertion_type (int): insert before equals(1) or insert
            %   after equals(2)
            % Call:
            % CS4300_PriorityQueue.add(CS4300_Node(...), 1)
            %
            new_nodes = CS4300_Node.empty;
            inserted = 0;
            if length(PQ.nodes) == 0
               new_nodes(1) = node;
            end
            for i=1:length(PQ.nodes)
                if insertion_type == 1
                    if node.cost <= PQ.nodes(i).cost && inserted == 0
                        inserted = 1;
                        new_nodes(i) = node;
                    end
                    new_nodes(i+inserted) = PQ.nodes(i);
                end
                if insertion_type == 2
                    if PQ.nodes(i).cost <= node.cost
                        new_nodes(i) = PQ.nodes(i);
                    elseif inserted == 0
                        new_nodes(i) = node;
                        inserted = 1;
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
            % remove - removes and returns the front node of the queue
            % On input:
            %   PQ (CS4300_PriorityQueue): priority queue to remove from
            % On output:
            %   node (CS4300_Node): node that was removed
            % Call:
            % node = CS4300_PriorityQueue.remove()
            %
            node = PQ.nodes(1);
            PQ.nodes = PQ.nodes(2:end);
        end
        
        function bool = contains(PQ, node)
            % contains - checks if node exists in queue
            % On input:
            %   PQ (CS4300_PriorityQueue): Priority queue to check for node
            %   node (CS4300_Node): Node to check for
            % On output:
            %   bool (boolean): true if contained, false if not
            % Call:
            % contains_node = CS4300_PriorityQueue.contains(node)
            %
            for i=1:length(PQ.nodes)
               if PQ.nodes(i).state == node.state
                  bool = true;
                  return;
               end
            end
            bool = false;
        end
    end
end

