function test_suite = minusTest()
    try
        yalmip('version');
        try
            test_functions = localfunctions();
        catch
        end
        initTestSuite;
    catch
        warning('Yalmip not found in the path, some tests will be skipped');
        test_suite=MOxUnitTestSuite();
    end
end

function test_cases
    % We do some sanity checks
    matrix = replab.CommutantVar.fromPermutations({[2 3 4 5 1]});
    
    difference = matrix - matrix;
    vars = difference.getVariables;
    for j = 1:length(vars)
        coeffs = getbasematrix(difference, vars(j));
        assert(norm(coeffs(:)) <= replab.Settings.doubleEigTol);
    end
end

function test_inputs
    matrix = replab.CommutantVar.fromPermutations({[3 2 1]});
    shouldProduceAnError(@(x) matrix - rand(5));
    shouldProduceAnError(@(x) matrix - rand(3));
    shouldProduceAnError(@(x) rand(5) - matrix);
    shouldProduceAnError(@(x) rand(3) - matrix);
end