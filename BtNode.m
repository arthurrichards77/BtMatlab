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
        
        function str = to_str(obj,prefix)
            str = '';
        end
        
        function disp(obj)
            disp(obj.to_str(''))
        end
        
    end
    
    methods (Abstract = true)        
        resp = do_task(obj)                    
    end
    
end