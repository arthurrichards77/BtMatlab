classdef BtrSuccess < BtResponse
    methods
        function obj = BtrSuccess()
            obj.resp_code = obj.SUCCESS;
        end
    end
end
