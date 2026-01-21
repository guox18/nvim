-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Leader 键改为反斜杠（保持和 vim 一致）
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- 每个窗口顶部显示相对路径（从当前工作目录开始）
vim.opt.winbar = "%{expand('%:.')}%m"
