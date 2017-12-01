classdef BtNode

    methods        
        function resp = tick(obj)
            resp = obj.do_task();
        end        
    end
    
    methods (Abstract = true)        
        resp = do_task(obj)            
    end
    
end