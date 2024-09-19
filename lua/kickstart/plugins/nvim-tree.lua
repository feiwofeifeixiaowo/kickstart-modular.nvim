return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- 默认映射
        api.config.mappings.default_on_attach(bufnr)

        -- 自定义映射
        vim.keymap.set('n', 'v', api.node.open.vertical, opts 'Open: Vertical Split')
        vim.keymap.set('n', 'h', api.node.open.horizontal, opts 'Open: Horizontal Split')
        vim.keymap.set('n', 'i', api.tree.toggle_gitignore_filter, opts 'Toggle Git Ignore')
        vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts 'Toggle Dotfiles')
        vim.keymap.set('n', 'I', api.node.show_info_popup, opts 'Info')
        vim.keymap.set('n', ']', api.tree.change_root_to_node, opts 'CD')
        vim.keymap.set('n', '[', api.tree.change_root_to_parent, opts 'Up')
      end,
    }
  end,
}
