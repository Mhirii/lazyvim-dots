return {
  "ribelo/taskwarrior.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  -- or
  config = true,

  keys = {
    {
      "<leader>t",
      function()
        require("taskwarrior_nvim").browser({ "ready" })
      end,
      desc = "Browse Tasks",
    },
  },
}
