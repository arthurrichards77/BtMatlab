classdef BtFailAfterMaxRuns < BtDecorator
    
    properties
        
        num_runs
        max_runs
        
    end
    
    methods
        
        function obj = BtFailAfterMaxRuns(n,child_node)
            assert(isnumeric(n)&&n>0)
            obj = obj@BtDecorator(child_node);
            obj.num_runs = 0;
            obj.max_runs = n;
        end
        
        function resp = do_task(obj)
            resp = obj.child.tick;
            if resp.is_running,
                obj.num_runs = obj.num_runs+1;
                if obj.num_runs>obj.max_runs,
                    resp = BtrFailure;
                end
            else
                obj.num_runs = 0;
            end
        end
        
        function reset(obj)
            obj.num_runs = 0;
        end
        
        function str = plot_str(obj)
            str = sprintf('Max %i steps',obj.max_runs);
        end
        
    end
    
end