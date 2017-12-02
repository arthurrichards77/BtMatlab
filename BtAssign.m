classdef BtAssign < BtNode
    
    properties (Access = private)
        lhs
        rhs
        cmp
    end
    
    methods
        function obj = BtAssign(lhs,rhs)
            assert(isa(lhs,'BtBlackboardEntry'))
            obj.lhs = lhs;
            if(isa(rhs,'BtBlackboardAffineExp')),
                obj.rhs = rhs;
            elseif isnumeric(rhs) && numel(rhs)==1,
                obj.rhs = BtBlackboardAffineExp(lhs.bb,{},[],rhs);
            else
                error('Cannot assign this value')
            end
        end
        function resp = do_task(obj)
            obj.lhs.set_value(obj.rhs.get_value());
            resp = BtrSuccess();
        end
        
        function str = to_str(obj,prefix)
            str = sprintf('%s %s = %s', prefix, obj.lhs.to_str, obj.rhs.to_str);
        end
    end
    
end