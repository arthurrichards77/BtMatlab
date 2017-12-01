classdef BtBlackboardEntry < BtBlackboardAffineExp
    
    properties (Access=private)
        name
    end
    
    methods
        
        function obj = BtBlackboardEntry(bb,name)
            obj = obj@BtBlackboardAffineExp(bb,{name},1.0,0.0);
            obj.name = name;
        end
        
        function set_value(obj,val)
            obj.bb.set_value(obj.name,val)
        end
        
        function str = to_str(obj)
            str = obj.name;
        end
        
    end
    
end