-- SYSTEM SETTINGS & LEADER
vim.g.mapleader = " "

-- Global Keymaps
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':Neotree toggle filesystem reveal left<CR>', {silent = true})


-- LAZY.NVIM BOOTSTRAP
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- INITIALIZE LAZY
require("lazy").setup("plugins")
