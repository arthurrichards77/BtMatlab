classdef BtResponse
    properties (Constant = true)
        FAILURE=0
        RUNNING=1
        SUCCESS=2
    end
    properties (Access = protected)
        resp_code = 0
    end
    methods
        function flag = is_failure(obj)
            flag = (obj.resp_code==obj.FAILURE);
        end
        function flag = is_running(obj)
            flag = (obj.resp_code==obj.RUNNING);
        end
        function flag = is_success(obj)
            flag = (obj.resp_code==obj.SUCCESS);
        end
        function disp(obj)
            if obj.resp_code == obj.FAILURE,
                disp('FAILURE')
            elseif obj.resp_code == obj.RUNNING,
                disp('RUNNING')
            elseif obj.resp_code == obj.SUCCESS,
                disp('SUCCESS')
            end
        end
    end
end
