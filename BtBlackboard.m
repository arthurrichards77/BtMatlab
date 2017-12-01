classdef BtBlackboard < handle
   
    properties (Access=private)
        bb_struct = struct()
    end
    
    methods
        function bb_item = add_item(obj,name,value)
            obj.bb_struct.(name)=value;
            bb_item = BtBlackboardEntry(obj,name);
        end
        function val = get_value(obj,name)
            val = obj.bb_struct.(name);
        end
        function set_value(obj,name,val)
            obj.bb_struct.(name) = val;
        end
    end
    
end