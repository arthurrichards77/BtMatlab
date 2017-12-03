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
        
        function local_plot(obj,xmin,xmax,ymax)
            hold on
            xctr = 0.5*(xmin+xmax);
            plot([xctr xctr],[ymax,ymax-1],'k-')
            local_plot@BtNode(obj,xmin,xmax,ymax)
            plot(obj.child,xmin,xmax,ymax-1)
        end
        
    end
    
    methods (Abstract = true)
        
        resp = do_task(obj)
        
    end
    
end