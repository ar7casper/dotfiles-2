return {
  'stevearc/oil.nvim',
  opts = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
    }
    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent direcotry' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
  end,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
