classdef BtBlackboardAffineExp
    
    properties (Access = protected)
        bb
        names = {}
        weights = []
        const_term = 0.0
    end
    
    methods

        function value = get_value(obj)
            value = obj.const_term;
            for ii=1:numel(obj.weights),
                value = value + obj.weights(ii)*obj.bb.get_value(obj.names{ii});
            end
        end
        
    end
    
    methods (Hidden = true)
        
        function obj = mtimes(obj1,obj2)
            if isa(obj1,'BtBlackboardAffineExp') && isnumeric(obj2) && numel(obj2)==1,
                obj=BtBlackboardAffineExp(obj1.bb,obj1.names,obj2*obj1.weights,obj2*obj1.const_term);
            elseif isa(obj2,'BtBlackboardAffineExp') && isnumeric(obj1) && numel(obj1)==1,
                obj=BtBlackboardAffineExp(obj2.bb,obj2.names,obj1*obj2.weights,obj1*obj2.const_term);
            else
                error('Can''t multiply expression this way.')
            end
        end
        
        function obj = plus(obj1,obj2)
            if isa(obj1,'BtBlackboardAffineExp') && isa(obj2,'BtBlackboardAffineExp'),
                assert(obj1.bb==obj2.bb)
                obj=BtBlackboardAffineExp(obj1.bb,[obj1.names,obj2.names], ...
                    [obj1.weights,obj2.weights],obj1.const_term+obj2.const_term);
            elseif isa(obj1,'BtBlackboardAffineExp') && isnumeric(obj2) && numel(obj2)==1,
                obj=BtBlackboardAffineExp(obj1.bb,obj1.names,obj1.weights,obj2+obj1.const_term);
            elseif isa(obj2,'BtBlackboardAffineExp') && isnumeric(obj1) && numel(obj1)==1,
                obj=BtBlackboardAffineExp(obj2.bb,obj2.names,obj2.weights,obj1+obj2.const_term);
            else
                error('Can''t add expressions this way.')
            end
        end
        
        function obj2 = uminus(obj1)
            obj2=BtBlackboardAffineExp(obj1.bb,obj1.names,-obj1.weights,-obj1.const_term);
        end
        
        function obj = minus(obj1,obj2)
            obj = obj1 + uminus(obj2);
        end
        
        function obj = le(obj1,obj2)
            obj = compare(obj1,obj2,'le');
        end
        
        function obj = ge(obj1,obj2)
            obj = compare(obj2,obj1,'le');
        end
        
        function str = to_str(obj)
            str = [];
            for ii=1:numel(obj.weights),
                str = [str sprintf('%.2f',obj.weights(ii)) '*' obj.names{ii} ' + '];
            end
            str = [str sprintf('%.2f',obj.const_term)];
        end
        
        function disp(obj)
            disp(obj.to_str)
        end
                
    end
    
    methods (Access = protected)
        
        function obj=BtBlackboardAffineExp(bb,names,weights,const_term)
            obj.bb = bb;
            obj.names = names;
            obj.weights = weights;
            obj.const_term = const_term;
        end
        
        function obj = compare(obj1,obj2,cmp)
            if isa(obj1,'BtBlackboardAffineExp') && isa(obj2,'BtBlackboardAffineExp'),
                obj=BtCondition(obj1,obj2,cmp);
            elseif isa(obj1,'BtBlackboardAffineExp') && isnumeric(obj2) && numel(obj2)==1,
                obj=BtCondition(obj1,BtBlackboardAffineExp(obj1.bb,{},[],obj2),cmp);
            elseif isa(obj2,'BtBlackboardAffineExp') && isnumeric(obj1) && numel(obj1)==1,
                obj=BtCondition(BtBlackboardAffineExp(obj2.bb,{},[],obj1),obj2,cmp);
            else
                error('Can''t compare expressions this way.')
            end
        end
        
    end
end