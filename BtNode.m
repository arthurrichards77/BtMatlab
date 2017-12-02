classdef BtNode < handle

    methods        
        function resp = tick(obj)
            resp = obj.do_task();
        end
        
        function reset(obj)
            % do nothing - may be overloaded
            % but instantiated here anyway 
            % so subclasses don't have to implement it
        end
        
    end
    
    methods (Abstract = true)        
        resp = do_task(obj)                    
    end
    
end