---@diagnostic disable: undefined-global
local wpicker = R 'window-picker'

local M = {}

--[[
-- Reteruns the file path and line number (if exists) under the cursor
--
-- @return { (file: string, line: number) }
--]]
function M.get_file_and_line_under_the_cursor()
    local isfname = vim.o.isfname
    vim.opt.isfname:append(':')

    -- get the file path including line number
    local text_object = vim.fn.expand('<cfile>')
    if text_object == '' then return end

    local file = text_object
    local line = nil

    -- extract the line number if exists
    if text_object:match(':%d+$') then
        file = text_object:gsub(':%d+$', '')
        line = tonumber(text_object:match('%d+$'))
    end

    vim.o.isfname = isfname

    return { file, line }
end

--[[
-- open the file under the cursor of users choice
-- IF there is no more than two window, this will split the window
-- IF the file not found, function will stop
--]]
function M.open_file_under_cursor()
    local text_object = M.get_file_and_line_under_the_cursor()

    if not text_object then return end

    local file = vim.fn.fnamemodify(text_object[1], ':p')
    local line = text_object[2]

    -- stop if the file does not exist
    if vim.fn.filereadable(file) == 0 then return end

    local selectable = wpicker.filter_windows()

    if #selectable < 2 then
        vim.cmd('vsp ' .. file)
    else
        local window = wpicker.pick_window(
                           {
                include_current_win = true,
            })

        if window then
            vim.api.nvim_set_current_win(window)
            vim.cmd('edit ' .. file)
        else
            return
        end
    end

    if line then
        vim.cmd(tostring(line))
        vim.api.nvim_input('zz')
    end
end

return M
