local function setup_dadbod()
  -- Your existing plugin configuration here

  -- Add the autocmd
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'dbout' },
    callback = function()
      vim.opt.foldenable = false
    end,
  })
end

return {
  {
    'kristijanhusak/vim-dadbod-ui',
    event = 'VeryLazy',
    keys = {
      { '<leader>dd', '<cmd>DBUIToggle<cr>', { desc = 'Toggle DB UI' } },
    },
  },
  { 'kristijanhusak/vim-dadbod-completion', event = 'VeryLazy' },
  {
    'tpope/vim-dadbod',
    event = 'VeryLazy',
    dependecnies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      setup_dadbod()
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependecnies = {
      'kristijanhusak/vim-dadbod-completion',
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = 'vim-dadbod-completion' })
    end,
  },
}
