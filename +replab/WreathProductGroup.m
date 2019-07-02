classdef WreathProductGroup < replab.SemidirectProductGroup
    
    properties (SetAccess = protected)
        A; % factor of base group
    end
        
    methods
        
        function self = WreathProductGroup(H, A)
            assert(isa(H, 'replab.PermutationGroup'));
            assert(isa(A, 'replab.FiniteGroup'));
            n = H.domainSize;
            base = replab.DirectProductGroup.power(A, n);
            phi = replab.perm.PermutationCellAction(H, base);
            self = self@replab.SemidirectProductGroup(phi);
            self.A = A;
        end
        
    end
    
end
