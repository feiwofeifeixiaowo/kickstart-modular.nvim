local fn = vim.fn

return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  opts = {
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    direction = 'horizontal',
    autochdir = true,
    persist_mode = true,
    insert_mappings = false,
    start_in_insert = true,
    winbar = { enabled = true },
    highlights = {
      FloatBorder = { guibg = 'Black', guifg = 'DarkGray' },
      NormalFloat = { guibg = 'Black' },
    },
    float_opts = {
      border = 'rounded',
      winblend = 3,
    },
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
  },

  config = function(_, opts)
    require('toggleterm').setup(opts)

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
