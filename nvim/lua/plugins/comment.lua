-- https://github.com/numToStr/Comment.nvim
-- 快捷键和 which key 集成，可以看下 API https://github.com/numToStr/Comment.nvim/blob/master/doc/API.md
return {
  'numToStr/Comment.nvim',
  config = function()
    Core.map({
      -- {
      --   mode = 'n',
      --   key = 'gc',
      --   action = '<cmd>lua require("Comment.api").toggle_current_linewise()<cr>',
      --   desc = 'toggle current linewise',
      -- },
      -- {
      --   mode = 'n',
      --   key = '<c-\\>',
      --   action = '<cmd>lua require("Comment.api").toggle_current_blockwise()<cr>',
      --   desc = 'toggle current blockwise',
      -- },
      {
        mode = 'n',
        key = 'gc',
        action = '<cmd>lua require("Comment.api").call("toggle_linewise_op")<cr>g@',
        desc = 'toggle linewise op',
      },
      {
        mode = 'n',
        key = 'gb',
        action = '<cmd>lua require("Comment.api").call("toggle_blockwise_op")<cr>g@',
        desc = 'toggle blockwise op',
      },
      -- {
      --   mode = 'x',
      --   key = '<c-/>',
      --   action = '<esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>',
      --   desc = 'toggle linewise op in visual mode',
      -- },
      {
        mode = 'x',
        key = 'gc',
        action = '<esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>',
        desc = 'toggle linewise op in visual mode',
      },
      {
        mode = 'x',
        key = 'gb',
        action = '<esc><cmd>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<cr>',
        desc = 'toggle blockwise op in visual mode',
      },
    })

    require('Comment').setup({})
  end,
}
