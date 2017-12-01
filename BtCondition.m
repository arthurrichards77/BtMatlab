classdef BtCondition < BtNode
    
    properties (Access = private)
        lhs
        rhs
        cmp
    end
    
    methods
        function obj = BtCondition(lhs,rhs,cmp)
            assert(isa(lhs,'BtBlackboardAffineExp'))
            obj.lhs = lhs;
            assert(isa(rhs,'BtBlackboardAffineExp'))
            obj.rhs = rhs;
            obj.cmp = cmp;
        end
        function resp = do_task(obj)
            switch obj.cmp
                case 'le'
                    if obj.lhs.get_value()<=obj.rhs.get_value(),
                        resp = BtrSuccess();
                    else
                        resp = BtrFailure();
                    end
            end
        end
        
        function disp(obj)
            switch obj.cmp
                case 'le'
                    disp([obj.lhs.to_str() ' <= ' obj.rhs.to_str()])
            end
        end
    end
    
end