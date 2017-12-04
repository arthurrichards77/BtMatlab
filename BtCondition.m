classdef BtCondition < BtNode & BtBlackboardAffineExp
    
    properties (Access = private)
        cmp
    end
    
    methods
        function obj = BtCondition(lhs,cmp)
            obj = obj@BtBlackboardAffineExp(lhs);
            obj.cmp = cmp;
        end
        function resp = do_task(obj)
            switch obj.cmp
                case '<=0'
                    if obj.get_value()<=0,
                        resp = BtrSuccess();
                    else
                        resp = BtrFailure();
                    end
                case '<0'
                    if obj.get_value()<0,
                        resp = BtrSuccess();
                    else
                        resp = BtrFailure();
                    end
                case '==0'
                    if obj.get_value()==0,
                        resp = BtrSuccess();
                    else
                        resp = BtrFailure();
                    end
            end
        end
        
        function str = to_str(obj,prefix)
            str = sprintf('%s%s %s', prefix, to_str@BtBlackboardAffineExp(obj), obj.cmp);
        end
        
        function str = plot_str(obj)
            str = to_str(obj,'');
        end
        
        function disp(obj)
            disp@BtNode(obj)
        end
        
    end
    
end