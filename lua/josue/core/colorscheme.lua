local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")

if not status then
  print("Color scheme not found")
end
