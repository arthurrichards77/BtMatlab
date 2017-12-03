classdef BtNode < handle
    
    methods
        function resp = tick(obj)
            resp = obj.do_task();
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
            text(xctr,ymax,obj.plot_str, ...
                'EdgeColor','Black','HorizontalAlignment','Center','BackgroundColor','White')
        end
        
        function str = plot_str(obj)
            str = 'Node';
        end
        
    end
    
    methods (Abstract = true)
        resp = do_task(obj)
    end
    
end