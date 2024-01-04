-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme tokyonight")

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_confirm_quit = true
  vim.o.guifont = "JetbrainsMono Nerd Font:h16"
  vim.opt.linespace = 4
  vim.g.neovide_profiler = false
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_theme = "auto"
  vim.g.neovide_transparency = 0.75
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_scroll_animation_length = 0.5
  vim.g.neovide_cursor_animation_length = 0.15
  vim.g.neovide_cursor_trail_size = 0.7
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_lifetime = 3
  vim.g.neovide_cursor_vfx_particle_density = 20
end
