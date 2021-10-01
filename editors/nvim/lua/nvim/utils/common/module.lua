local Pattern = R 'nvim.utils.common.pattern'

local unload_package = function(package_name)
    local esc_package_name = Pattern.escape_pattern(package_name)

    for module_name, _ in pairs(package.loaded) do
        if string.find(module_name, esc_package_name) then
            package.loaded[module_name] = nil
        end
    end
end

local reload_package = function(package_name)
    unload_package(package_name)
    R(package_name)
end

return { unload_package = unload_package, reload_package = reload_package }
