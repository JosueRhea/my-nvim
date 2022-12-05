local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
  print("Packer not required")
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'bluz71/vim-nightfly-guicolors'

  use 'folke/tokyonight.nvim'
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  
  use("nvim-tree/nvim-tree.lua")

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  use("nvim-lualine/lualine.nvim")

   -- fuzzy finding w/ telescope  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  if packer_bootstrap then
    require('packer').sync()
  end
end)

