"""
    is_closed_downwards(X::AbstractMatrix)

Interpret each row of the `N x D` matrix `X` as a vector-valued observation.
"""
is_closed_downwards(X::AbstractMatrix{<:Real}) = true
function is_closed_downwards(X::AbstractMatrix{<:Union{<:Real, Missing}})
    for d in 2:size(X, 2), n in 1:size(X, 1)
        X[n, d-1] isa Missing && !(X[n, d] isa Missing) && return false
    end
    return true
end
