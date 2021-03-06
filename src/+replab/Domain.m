classdef Domain < replab.Str
% Describes a set of elements with a common structure
%
% Those elements can be compared ("eqv"), and random elements
% can be produced ("sample").
    
    methods % ABSTRACT
        
        function b = eqv(self, t, u)
        % Tests domain elements for equality/equivalence
        %
        % Args:
        %   t (domain element): First element to test
        %   u (domain element): Second element to test
        %
        % Returns:
        %   logical: True when t and u are equivalent, and false otherwise
            error('Abstract');
        end
        
        function t = sample(self)
        % Samples an element from this domain
        %
        % This method does not make any guarantees about genericity, and is primarily
        % used for law checks.
        %
        % Returns:
        %   domain element: Random domain element
            error('Abstract');
        end
        
    end
    
    methods (Static)
        
        function domain = lambda(header, eqvFun, sampleFun)
        % Constructs a domain from function handles
        %
        % Args:
        %   header (char): Header display string
        %   eqvFun (function_handle): Handle implementing the `eqv` method
        %   sampleFun (function_handle): Handle implementing the `sample` method
        %
        % Returns:
        %   replab.Domain: The constructed domain
            domain = replab.lambda.Domain(header, eqvFun, sampleFun);
        end
        
    end
    
    methods % Test helpers
       
        function assertNotEqv(self, x, y, context)
        % Asserts that "x" and "y" are equivalent
            if self.eqv(x, y)
                errorDesc = 'The values %s and %s are equivalent, but they should not be';
                errorId = 'assertNotEqual:equal';
            else
                return
            end
            
            if nargin < 4
                context = '';
            end
            
            names = evalin('caller', 'who');
            nV = length(names);
            values = cell(1, nV);
            for i = 1:nV
                values{i} = evalin('caller', names{i});
            end
            
            message = replab.laws.message(errorDesc, context, {x y}, names, values);
            if moxunit_util_platform_is_octave()
                error(errorId, '%s', message);
            else
                throwAsCaller(MException(errorId, '%s', message));
            end            

        end
            
        function assertEqv(self, x, y, context)
        % Asserts that "x" and "y" are not equivalent
            if ~self.eqv(x, y)
                errorDesc = 'The values %s and %s are not equivalent';
                errorId = 'assertEqual:nonEqual';
            else
                return
            end
            
            if nargin < 4
                context = '';
            end
            
            names = evalin('caller', 'who');
            nV = length(names);
            values = cell(1, nV);
            for i = 1:nV
                values{i} = evalin('caller', names{i});
            end
            
            message = replab.laws.message(errorDesc, context, {x y}, names, values);
            if moxunit_util_platform_is_octave()
                error(errorId, '%s', message);
            else
                throwAsCaller(MException(errorId, '%s', message));
            end            

        end

    end
    
end
