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
        
        function disp(obj)
            fprintf('%s with %i children : \n',class(obj),obj.num_children);
            for ii=1:obj.num_children,
                obj.children{ii}.disp
            end
        end
        
    end
    
    methods (Abstract = true)
        resp = do_task(obj)            
    end
    
end
            
            
            