local M = {}

function M.execute_command(command, callback)
    LSP.buf_request(
        0, 'workspace/executeCommand', command, function(err, _, res)
            if callback then
                callback(err, res)
            elseif err then
                print('Execute command failed: ' .. err.message)
            end
        end)
end

return M
