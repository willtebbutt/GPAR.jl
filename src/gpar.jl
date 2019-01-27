using Stheno: AbstractGP


"""
    GPARegressor(gps::Vector{<:AbstractGP}; replaces=false, imputes=false)

Construct a GPARegressor object with the vector of Gaussian processes `gps`.
"""
struct GPARegressor{Tgps<:Vector{<:AbstractGP}}
    gps::Tgps
    replaces::Bool
    imputes::Bool
end
function GPARegressor(gps::Vector{<:AbstractGP}; replaces=false, imputes=false)
    return GPARegressor(gps, replaces, imputes)
end

replaces(gpar::GPARegressor) = gpar.replaces
imputes(gpar::GPARegressor) = gpar.imputes 

"""
    FiniteGPARegressor{Tgpar<:GPARegressor, TX}

Finite-dimensional GPAR object. Lightweight wrapper around input data.
"""
struct FiniteGPARegressor{Tgpar<:GPARegressor, TX}
    gpar::Tgpar
    X::TX
end

"""
    (gpar::GPARegressor)(x::AbstractVector)

Index into `gpar` at `x` to construct a `FiniteGPARegressor`.
"""
(gpar::GPARegressor)(x::AbstractVector) = FiniteGPARegressor(gpar, x)

"""
    rand(rng::AbstractRNG, gpar::FiniteGPARegressor, S::Integer)

Generate `S` i.i.d. draws from `gpar` using `rng`. If `gpar` isn't finite-dimensional, or
equivalently each element of `gpar.gps` isn't a finite-dimensional GP, and error is thrown.
"""
function Stheno.rand(rng::AbstractRNG, finite_gpar::FiniteGPARegressor, S::Integer)
    gpar, X = finite_gpar.gpar, finite_gpar.X
    for d in 1:length(gpar.gps)

    end
    return 
end
