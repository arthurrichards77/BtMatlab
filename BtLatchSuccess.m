classdef BtLatchSuccess < BtDecorator
    
    properties
        
        has_succeeded
        
    end
    
    methods
        
        function obj = BtLatchSuccess(child_node)
            obj = obj@BtDecorator(child_node);
            obj.has_succeeded = false;
        end
        
        function resp = do_task(obj)
            if obj.has_succeeded,
                resp = BtrSuccess;
            else
                resp = obj.child.tick;
                if resp.is_success,
                    obj.has_succeeded = true;
                end
            end
        end
        
        function reset(obj)
            obj.has_succeeded = false;
        end
        
        function str = plot_str(obj)
            str = 'LatchSuccess';
        end
        
    end
    
end