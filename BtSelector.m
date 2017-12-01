classdef BtSelector < BtParent
   
    methods
       
        function obj = BtSelector(varargin)
            obj = obj@BtParent(varargin{:});
        end
        
        function resp = do_task(obj)
           
            for ii=1:obj.num_children,
               
                this_resp = obj.children{ii}.tick;
                if this_resp.is_success,
                    resp = this_resp;
                    break
                elseif this_resp.is_running,
                    resp = this_resp;
                    break
                end
                resp = BtrFailure;
                
            end
            
        end
        
    end
    
end