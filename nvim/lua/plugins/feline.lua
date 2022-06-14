-- https://github.com/feline-nvim/feline.nvim
return {
  'feline-nvim/feline.nvim',
  config = function()
    Core.set({
      {
        name = 'termguicolors',
        value = true,
        type = 'option',
      },
    });

    local transparent = vim.g.gruvbox_transparent
    local colors = {
      -- bg = "#1F1F23",
      bg = transparent and "none" or "#1f1f23",
      oceanblue = "#a9b665",
      skyblue = '#a96b2c',
      black = "#1B1B1B",
      cyan = "#009090",
      fg = '#d4be98',
      green = "#60A040",
      connected = "#b8bb26",
      magenta = "#C26BDB",
      orange = "#FF9000",
      red = "#ea6962",
      violet = "#9E93E8",
      white = "#eeeeee",
      yellow = "#E1E120",
      warning = "#fabd2f",
      hint = "#83a598",
      info = "#a0c980",
      error = "#ea6962"
    }
    require('feline').setup{
      theme = colors,
    }
  end,
}
