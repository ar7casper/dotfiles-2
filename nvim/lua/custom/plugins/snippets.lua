return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  opts = {
    history = true,
    delete_check_events = 'TextChanged',
  },
  keys = {
    {
      '<C-k>',
      function()
        local ls = require 'luasnip'
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      mode = { 'i', 's' },
      silent = true,
    },
    {
      '<C-j>',
      function()
        local ls = require 'luasnip'
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      mode = { 'i', 's' },
      silent = true,
    },
  },
  config = function(_, opts)
    local ls = require 'luasnip'
    ls.setup(opts)

    require('luasnip.loaders.from_lua').load { paths = './snippets/elixir.lua' }

    vim.api.nvim_create_autocmd('InsertLeave', {
      callback = function()
        if ls.session.current_nodes[vim.api.nvim_get_current_buf()] and not ls.session.jump_active then
          ls.unlink_current()
        end
      end,
    })
  end,
}

-- local ls = require 'luasnip'
--
-- vim.snippet.expand = ls.lsp_expand
--
-- vim.snippet.active = function(filter)
--   filter = filter or {}
--   filter.direction = filter.direction or 1
--
--   if filter.direction == 1 then
--     return ls.expand_or_jumpable()
--   else
--     return ls.jumpable(filter.direction)
--   end
-- end
--
-- vim.snippet.jump = function(direction)
--   if direction == 1 then
--     if ls.expandable() then
--       return ls.expand_or_jump()
--     else
--       return ls.jumpable(1) and ls.jump(1)
--     end
--   else
--     return ls.jumpable(-1) and ls.jump(-1)
--   end
-- end
--
-- vim.snippet.stop = ls.unlink_current
--
-- -- CONFIG
--
-- ls.config.set_config {
--   history = true,
--   updateevents = 'TextChanged,TextChangedI',
--   override_builtin = true,
-- }
--
-- vim.keymap.set({ 'i', 's' }, '<c-k>', function()
--   return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
-- end, { silent = true })
--
-- vim.keymap.set({ 'i', 's' }, '<c-j>', function()
--   return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
-- end, { silent = true })
--
-- return {}
