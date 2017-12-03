classdef BtParallel < BtParent
   
    properties (Access = private)
        n
    end
    
    methods
       
        function obj = BtParallel(n,varargin)        
            assert(isnumeric(n)&&n>0)
            obj = obj@BtParent(varargin{:});
            obj.n = n;
        end
        
        function resp = do_task(obj)
           
            for ii=1:obj.num_children,               
                this_resp = obj.children{ii}.tick;
                child_running(ii) = this_resp.is_running;
                child_success(ii) = this_resp.is_success;                                
            end
            if all(child_running),
                resp = BtrRunning;
            elseif sum(child_success)>=obj.n,
                resp = BtrSuccess;
            else
                resp = Btrfailure;
            end
            
        end
        
        function str = plot_str(obj)
            str = '||';
        end
        
    end
    
end