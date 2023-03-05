local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, 'lazy')
if not status_ok then
  return
end


require("lazy").setup({
  spec = {
    {
      'navarasu/onedark.nvim',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- other colorschemes:
    { 'tanvirtin/monokai.nvim', lazy = true },

    -- Icons
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- File explorer
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    { 'lewis6991/gitsigns.nvim', lazy = true },

    -- Status line bar
    {
      'freddiehaddad/feline.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons'
      }
    }
  }
})
