classdef BtParent < BtNode
    
    properties (Access = protected)
        children = {}
        num_children = 0
    end
    
    methods
        
        function obj = BtParent(varargin)            
            for ii=1:numel(varargin),
                n = varargin{ii};                
                assert(isa(n,'BtNode'))
                obj.num_children = obj.num_children+1;
                obj.children{obj.num_children} = n;
            end
        end
        
        function reset(obj)
            for ii=1:obj.num_children,
                obj.children{ii}.reset
            end
        end
        
        function str = to_str(obj,prefix)
            str = sprintf('%s%s with %i children : ',prefix,class(obj),obj.num_children);
            child_prefix = sprintf('*%s',prefix);
            for ii=1:obj.num_children,
                str = sprintf('%s\n%s%s',str,prefix,obj.children{ii}.to_str(child_prefix));
            end
        end
        
    end
    
    methods (Abstract = true)
        resp = do_task(obj)            
    end
    
end
            
            
            