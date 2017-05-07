module MInterpolations

immutable LinInterp
    grid::Array
    vals::Array
end

function (points::LinInterp)(x::Real)
    grid = points.grid; vals = points.vals
    lower_index = searchsortedlast(points.grid, x)

    # 補外に対応
    if lower_index == 0 
        lower_index = 1
    elseif lower_index == length(grid)
        lower_index = length(grid) - 1
    end

    upper_index = lower_index + 1
    grid_step = grid[upper_index] - grid[lower_index]
    val_step = vals[upper_index] - vals[lower_index]
    iterp_val = vals[lower_index] + (val_step / grid_step) * (x - grid[lower_index])

    return iterp_val
end

end # module
