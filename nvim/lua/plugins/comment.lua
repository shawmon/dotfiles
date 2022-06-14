-- https://github.com/numToStr/Comment.nvim
-- 快捷键和 which key 集成，可以看下 API https://github.com/numToStr/Comment.nvim/blob/master/doc/API.md
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
}
