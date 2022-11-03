local keymap = vim.keymap

-- Remap semicolon , as leader key
keymap.set('n', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Movements --
keymap.set('', 'j', 'h')
keymap.set('', 'k', 'j')
keymap.set('', 'l', 'k')
keymap.set('', ';', 'l')

-- Don't yank on delete char
keymap.set('n', '<del>', '"_x')
keymap.set('n', 'x', '"_x')
keymap.set('n', 'X', '"_X')
keymap.set('v', 'x', '"_x')
keymap.set('v', 'X', '"_X')

-- Don't yank on delete line
keymap.set('n', 'd', '"_d')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Press jk fast to enter
keymap.set('i', 'kk', '<ESC>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Moving between windows
keymap.set('', '<C-w>j', '<C-w>h')
keymap.set('', '<C-w>k', '<C-w>j')
keymap.set('', '<C-w>l', '<C-w>k')
keymap.set('', '<C-w>;', '<C-w>l')

-- Keep visual mode indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Save file by CTRL-S
keymap.set('n', '<C-s>', ':w<CR>')
keymap.set('i', '<C-s>', '<ESC> :w<CR>')

-- Remove highlights
keymap.set('n', '<ESC>', ':noh<CR><CR>')

-- Don't yank on visual paste
keymap.set('v', 'p', '_dP')
