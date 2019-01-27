using GPAR: GPARegressor, FiniteGPARegressor, is_closed_downwards, replaces, imputes

@testset "gpar" begin

    @testset "GPARegressor" begin
        f1, f2 = GP(EQ(), GPC()), GP(EQ(), GPC())
        gpar = GPARegressor([f1, f2])

        @test replaces(gpar) == false
        @test imputes(gpar) == false
    end

    @testset "indexing" begin
        rng, N = MersenneTwister(123456), 10
        x = randn(rng, N)
        f = GP(EQ(), GPC())
        gpar = GPARegressor([f, f]; replaces=true, imputes=true)
        finite_gpar = gpar(x)

        @test finite_gpar isa FiniteGPARegressor
    end

    @testset "rand" begin
        rng, N, S = MersenneTwister(123456), 10, 3
        x = randn(rng, N)
        f1 = GP(ZeroMean(), EQ(), GPC())
        f2 = GP(OneMean(), EQ(), GPC())
        gpar = GPARegressor([f1, f2])(x)

        @test size(rand(rng, gpar, 1)) == (N, 2, 1)
        @test size(rand(rng, gpar, S)) == (N, 2, S)
    end

    @testset "logpdf" begin
        
    end
end
