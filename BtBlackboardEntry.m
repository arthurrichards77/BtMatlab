classdef BtBlackboardEntry < BtBlackboardAffineExp
    
    properties
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
            str = sprintf('(%s : %f)',obj.name,obj.get_value);
        end
        
    end
    
end