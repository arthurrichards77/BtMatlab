classdef BtrFailure < BtResponse
    methods
        function obj = BtrFailure()
            obj.resp_code = obj.FAILURE;
        end
    end
end
