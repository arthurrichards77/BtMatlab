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
        
        function str = to_str(obj,prefix)
            switch obj.cmp
                case 'le'
                    str = sprintf('%s%s <= %s', prefix, obj.lhs.to_str(), obj.rhs.to_str());
            end
        end
        
        function str = plot_str(obj)
            switch obj.cmp
                case 'le'
                    str = sprintf('%s<=%s', obj.lhs.to_str(), obj.rhs.to_str());
            end
        end
                
    end
    
end