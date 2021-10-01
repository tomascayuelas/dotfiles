local M = {}

function M.name()
    local BinaryFormat = package.cpath:match('%p[\\|/]?%p(%a+)')

    if BinaryFormat == 'dll' then
        return 'windows'
    elseif BinaryFormat == 'so' then
        return 'linux'
    elseif BinaryFormat == 'dylib' then
        return 'macos'
    end
end

function M.run_on_os(callbacks)
    local os = M.name()
    if callbacks[os] then callbacks[os]() end
end

return M
