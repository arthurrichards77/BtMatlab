classdef BtDecorator < BtNode
    
    properties
        
        child
        
    end
    
    methods
        
        function obj = BtDecorator(child_node)
            assert(isa(child_node,'BtNode'))
            obj.child = child_node;
        end
        
        function str = to_str(obj,prefix)
            str = sprintf('%s %s on : %s',prefix,class(obj),obj.child.to_str(prefix));
        end
        
    end
    
    methods (Abstract = true)
        
        resp = do_task(obj)
        
    end
    
end