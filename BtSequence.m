classdef BtSequence < BtParent
   
    methods
       
        function obj = BtSequence(varargin)
            obj = obj@BtParent(varargin{:});
        end
        
        function resp = do_task(obj)
           
            for ii=1:obj.num_children,
               
                this_resp = obj.children{ii}.tick;
                if this_resp.is_running,
                    resp = this_resp;
                    return
                elseif this_resp.is_failure,
                    resp = this_resp;
                    return
                end
                resp = BtrSuccess;
                
            end
            
        end
        
    end
    
end