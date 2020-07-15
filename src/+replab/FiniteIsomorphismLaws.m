classdef FiniteIsomorphismLaws < replab.FiniteMorphismLaws

    properties (SetAccess = protected)
        morphism % (`+replab.FiniteIsomorphism`): Morphism tested
        S % `.FiniteGroup`: Source group
        T % `.FiniteGroup`: Target group
    end

    methods

        function self = FiniteIsomorphismLaws(morphism)
            self.morphism = morphism;
            self.S = morphism.source;
            self.T = morphism.target;
        end

    end

    methods % Laws

    end

end