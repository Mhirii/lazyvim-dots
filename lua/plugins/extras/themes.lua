return {

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background = true,
        transparent_background_level = 2,
        ui_contrast = "high",
      })
    end,
  },
  {
    "Everblush/nvim",
    name = "everblush",
    config = function()
      require("everblush").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "Alexis12119/nightly.nvim",
    name = "nightly",
    config = function()
      require("nightly").setup({
        transparent = true,
        styles = {
          comments = { italic = true },
          functions = { italic = false },
          variables = { italic = false },
          keywords = { italic = false },
        },
        highlights = {},
      })
    end,
  },
}
