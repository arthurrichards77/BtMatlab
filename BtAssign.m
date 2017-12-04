classdef BtAssign < BtNode & BtBlackboardAffineExp
    
    properties (Access = private)
        target
    end
    
    methods
        function obj = BtAssign(lhs,rhs)
            obj = obj@BtBlackboardAffineExp(rhs);
            assert(isa(lhs,'BtBlackboardEntry'))
            obj.target = lhs;
        end
        function resp = do_task(obj)
            obj.target.set_value(obj.get_value());
            resp = BtrSuccess();
        end
        
        function str = to_str(obj,prefix)
            str = sprintf('%s Set %s = %s', prefix, obj.target.name, to_str@BtBlackboardAffineExp(obj));
        end
        
        function str = plot_str(obj)
            str = obj.to_str('');
        end
        
        function disp(obj)
            disp@BtNode(obj)
        end
                
    end
    
end