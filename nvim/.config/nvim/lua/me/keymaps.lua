local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Movements 
keymap("", "j", "h")
keymap("", "k", "j")
keymap("", "l", "k")
keymap("", ";", "l")

-- Don't yank on delete char
keymap('n', '<del>', '"_x')
keymap('n', 'x', '"_x')
keymap('n', 'X', '"_X')
keymap('v', 'x', '"_x')
keymap('v', 'X', '"_X')

-- Don't yank on delete line
keymap('n', 'd', '"_d')

-- Increment/Decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Move the selection up or down
keymap("v", "K", ":m '>+1<CR>gv=gv")
keymap("v", "L", ":m '<-2<CR>gv=gv")

-- Press jk fast to enter
keymap('i', 'kk', '<ESC>')

-- Delete a word backwards
keymap('n', 'dw', 'vb"_d')

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- Moving between windows
keymap("", "<C-w>j", "<C-w>h")
keymap("", "<C-w>k", "<C-w>j")
keymap("", "<C-w>l", "<C-w>k")
keymap("", "<C-w>;", "<C-w>l")

-- Keep visual mode indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Save file by CTRL-S
keymap('n', '<C-s>', ':w<CR>')
keymap('i', '<C-s>', '<ESC> :w<CR>')

-- Remove highlights
keymap('n', '<ESC>', ':noh<CR><CR>')

-- Don't yank on visual paste
keymap('v', 'p', '_dP')

