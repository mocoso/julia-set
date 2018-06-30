# the julia iteration function
function julia(z, maxiter::Int64)
    c=-0.8+0.156im
    for n = 1:maxiter
        if abs(z) > 2
            return n-1
        end
        z = z^2 + c
    end
    return maxiter
end
