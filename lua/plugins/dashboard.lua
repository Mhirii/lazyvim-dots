Headers = function()
  math.randomseed(os.time())
  local headers = {
    [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]],

    -- [[
    --         ___            __                       _     __
    --       F _ ",  ___ _   LJ    ____      ____    FJ_    LJ   _ ___      ____
    --       J `-' | F __` L  FJ   F __ J    F ___J  J  _|       J '__ J    F __ J
    --       |  __/F| |--| | J  L | _____J  | '----_ | |-'   FJ  | |__| |  | _____J
    --       F |__/ F L__J J J  L F L___--. )-____  LF |__-.J  L F L  J J  F L___--.
    --     J__|   J\____,__LJ__LJ\______/FJ\______/F\_____/J__LJ__L  J__LJ\______/F
    --     |__L    J____,__F|__| J______F  J______F J_____F|__||__L  J__| J______F
    -- ]],

    [[
        .s5SSSs.                                                                            
              SS. .s5SSSs.  .s        .s5SSSs.  .s5SSSs.  .s5SSSSs. s.  .s    s.  .s5SSSs.  
        sS    S%S       SS.                 SS.       SS.    SSS    SS.       SS.       SS. 
        SS    S%S sS    S%S sS        sS    `:; sS    `:;    S%S    S%S sSs.  S%S sS    `:; 
        SS .sS::' SSSs. S%S SS        SSSs.     `:;;;;.      S%S    S%S SS `S.S%S SSSs.     
        SS        SS    S%S SS        SS              ;;.    S%S    S%S SS  `sS%S SS        
        SS        SS    `:; SS        SS              `:;    `:;    `:; SS    `:; SS        
        SS        SS    ;,. SS    ;,. SS    ;,. .,;   ;,.    ;,.    ;,. SS    ;,. SS    ;,. 
        `:        :;    ;:' `:;;;;;:' `:;;;;;:' `:;;;;;:'    ;:'    ;:' :;    ;:' `:;;;;;:' 
    ]],

    [[
        ██████╗  █████╗ ██╗     ███████╗███████╗████████╗██╗███╗   ██╗███████╗
        ██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝╚══██╔══╝██║████╗  ██║██╔════╝
        ██████╔╝███████║██║     █████╗  ███████╗   ██║   ██║██╔██╗ ██║█████╗  
        ██╔═══╝ ██╔══██║██║     ██╔══╝  ╚════██║   ██║   ██║██║╚██╗██║██╔══╝  
        ██║     ██║  ██║███████╗███████╗███████║   ██║   ██║██║ ╚████║███████╗
        ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝
    ]],
  }
  return headers[math.random(1, #headers)]
end

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = Headers()
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope projects",                                       desc = " Projects",        icon = " ", key = "p" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
