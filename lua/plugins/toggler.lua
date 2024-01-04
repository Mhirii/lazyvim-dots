return {
  "nguyenvukhang/nvim-toggler",
  config = function()
    require("nvim-toggler").setup({
      inverses = {
        ["vim"] = "emacs",
        ["const"] = "let",
        ["interface"] = "type",
        ["!=="] = "===",
      },
    })
  end,
}

-- require('nvim-toggler').toggle
