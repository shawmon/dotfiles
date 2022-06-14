-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    Core.set({
      {
        name = 'list',
        value = true,
        type = 'option',
      },
      {
        name = 'listchars',
        value = 'tab:»_,space:⋅,trail:⋅,eol:↴,nbsp:⋅',
        type = 'option',
      },
    })

    require('indent_blankline').setup {
      show_end_of_line = true,
      space_char_blankline = " ",
    }
  end,
}
