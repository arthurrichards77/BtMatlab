classdef BtDecorator < BtNode
    
    properties
        
        child
        
    end
    
    methods
        
        function obj = BtDecorator(child_node)
            assert(isa(child_node,'BtNode'))
            obj.child = child_node;
        end
        
        function disp(obj)
            fprintf('%s on : \n',class(obj));
            obj.child.disp
        end
        
    end
    
    methods (Abstract = true)
        
        resp = do_task(obj)
        
    end
    
end