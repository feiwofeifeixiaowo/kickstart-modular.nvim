return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    'gruvbox-community/gruvbox',
    'joshdick/onedark.vim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- 定义一个主题列表
      local colorschemes = {
        'tokyonight-night',
        'tokyonight-storm',
        'gruvbox',
        'onedark',
        'evening',
      }

      -- 随机选择一个主题
      local index = math.random(#colorschemes)
      local selected_scheme = colorschemes[index]

      -- 应用选定的主题
      vim.cmd.colorscheme(selected_scheme)
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
