local Command = {}

Command.cmd = function(commands)
    for _, value in ipairs(commands) do V.cmd(value) end
end

return Command
