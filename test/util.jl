using GPAR: is_closed_downwards

@testset "util" begin
    @testset "is_closed_downwards" begin
        @test is_closed_downwards(randn(10, 2))

        X = fill!(Matrix{Union{Float64, Missing}}(undef, 10, 3), 5.0)
        @test is_closed_downwards(X)

        X[1, end] = missing
        @test is_closed_downwards(X)

        X[1, end-1] = missing
        @test is_closed_downwards(X)

        X[1, end-2] = missing
        @test is_closed_downwards(X)

        X[2, 2] = missing
        @test !is_closed_downwards(X)
    end
end
