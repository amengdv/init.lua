vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('i', '<C-c>', '<Esc>');

vim.keymap.set('n', '<C-.>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', "<C-,>", '<cmd>cprev<CR>zz')

vim.keymap.set('v', 'J', ":m '>+1'<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2'<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
