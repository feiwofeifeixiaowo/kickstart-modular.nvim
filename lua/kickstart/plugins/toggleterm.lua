local fn = vim.fn

return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'rounded',
        winblend = 3,
      },
    }

    local Terminal = require('toggleterm.terminal').Terminal

    -- Define lazygit within the config function scope
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
    }

    -- Create a key mapping to toggle lazygit
    vim.api.nvim_set_keymap('n', '<leader>tg', '', {
      callback = function()
        lazygit:toggle()
      end,
      noremap = true,
      silent = true,
      desc = 'Toggle LazyGit',
    })
  end,
}
