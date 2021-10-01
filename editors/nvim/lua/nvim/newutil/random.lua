local Random = {}

function Random.get_random_int()
    return math.random(os.time())
end

return Random
