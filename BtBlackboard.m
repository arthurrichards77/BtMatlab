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
        function disp(obj)
            entry_names = fieldnames(obj.bb_struct);
            num_entries = numel(entry_names);
            for ii=1:num_entries,
                fprintf('( %s : %f )\n',entry_names{ii},obj.bb_struct.(entry_names{ii}))
            end
        end
    end
    
end