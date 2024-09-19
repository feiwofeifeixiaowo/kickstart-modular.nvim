-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize with arrows
-- delta: 2 lines
-- vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize current window Up 2p' })
-- vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize current window Down 2p' })
-- vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize current window Left 2p' })
-- vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize current window Right 2p' })
--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- nvim-tree keymaps
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>er', ':NvimTreeRefresh<CR>', { noremap = true, silent = true, desc = 'Refresh NvimTree' })

-- Bufferline 键位映射
vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- 关闭当前缓冲区
-- vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>bdelete<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
