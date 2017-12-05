classdef BtNode < handle
    
    properties
        last_resp
    end
    
    methods
        function resp = tick(obj)
            resp = obj.do_task();
            obj.last_resp = resp;
        end
        
        function reset(obj)
            % do nothing - may be overloaded
            % but instantiated here anyway
            % so subclasses don't have to implement it
        end
        
        function str = to_str(obj,prefix)
            str = '';
        end
        
        function disp(obj)
            disp(obj.to_str(''))
        end
        
        function plot(obj,xmin,xmax,ymax)
            if nargin~=4,
                xmin = 0;
                xmax = 1;
                ymax = 0;
            end
            local_plot(obj,xmin,xmax,ymax)
        end
        
        function local_plot(obj,xmin,xmax,ymax)
            xctr = 0.5*(xmin+xmax);
            if isa(obj.last_resp,'BtResponse'),
                if obj.last_resp.is_failure,
                    col = 'Red';
                elseif obj.last_resp.is_success,
                    col = 'Green';
                elseif obj.last_resp.is_running,
                    col = 'Yellow';
                end
            else
                col = 'Black';
            end
            text(xctr,ymax,obj.plot_str, ...
                'EdgeColor',col,'HorizontalAlignment','Center','BackgroundColor','White')
        end
        
        function str = plot_str(obj)
            str = 'Node';
        end
        
    end
    
    methods (Abstract = true)
        resp = do_task(obj)
    end
    
end