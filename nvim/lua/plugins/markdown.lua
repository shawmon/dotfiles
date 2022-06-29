
-- https://github.com/iamcco/markdown-preview.nvim
return {
  'iamcco/markdown-preview.nvim',
  -- run = function()
  --   vim.fn["mkdp#util#install"]()
  -- end,
  run = "cd app && npm install",
  config = function()
    Core.set({
      {
        name = 'mkdp_filetypes',
        value = { 'markdown' },
        type = 'variable',
      }
    })
    Core.map({
      {
        mode = 'n',
        key = '<c-p>',
        action = '<cmd> MarkdownPreviewToggle',
        desc = 'toggle markdown preview',
      }
    })
  end,
  ft = { "markdown" }
}

