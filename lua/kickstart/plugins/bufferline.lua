return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      vim.opt.termguicolors = true
      require('bufferline').setup {
        options = {
          -- 使用 nvim 内置lsp
          --diagnostics = "nvim_lsp",
          -- 左侧让出 nvim-tree 的位置
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'left',
            },
            {
              filetype = 'vista',
              text = function()
                return vim.fn.getcwd()
              end,
              highlight = 'Tags',
              text_align = 'right',
            },
          },
        },
      }
    end,
  },
}
