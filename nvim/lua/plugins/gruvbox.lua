-- https://github.com/eddyekofo94/gruvbox-flat.nvim
return {
  'eddyekofo94/gruvbox-flat.nvim',
  config = function()
    local gruvbox_transparent = true
    local gruvbox_theme = gruvbox_transparent and { NvimTreeNormal = {
      bg = 'none',
    } } or {}

    Core.set({
      {
        name = 'gruvbox_flat_style',
        value = 'dark',
        type = 'variable',
      },
      {
        name = 'gruvbox_transparent',
        value = gruvbox_transparent,
        type = 'variable',
      },
      {
        name = 'gruvbox_italic_functions',
        value = true,
        type = 'variable',
      },
      {
        name = 'gruvbox_italic_variables',
        value = true,
        type = 'variable',
      },
      {
        name = 'gruvbox_dark_sidebar',
        value = false,
        type = 'variable',
      },
      {
        name = 'gruvbox_theme',
        value = gruvbox_theme,
        type = 'variable',
      },
      {
        name = 'gruvbox_colors',
        value = {},
        type = 'variable',
      },
    })

    vim.cmd [[colorscheme gruvbox-flat]]
    -- vim.cmd[[hi NvimTreeNormal guibg=none ctermbg=none]]
  end
}
