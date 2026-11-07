-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Leader 键改为反斜杠（保持和 vim 一致）
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- 不把无名寄存器绑定到系统剪贴板，避免 d/c/s/x 等删除操作污染剪贴板。
-- 系统剪贴板复制由 plugins/osc52.lua 中的 TextYankPost 仅在 y 操作时处理。
vim.opt.clipboard = ""

-- 每个窗口顶部显示相对路径（从当前工作目录开始）
vim.opt.winbar = "%{expand('%:.')}%m"

-- Esc 序列（如 Option+左/右/Delete）的识别等待时间
-- 终端会一次性发出整个序列, 50ms 足够; 太大会让 Esc 退出插入模式有明显延迟
vim.opt.ttimeoutlen = 50

-- 禁用未使用的 provider, 省掉启动时探测 python/ruby/perl/node 的开销 (python3 单项 ~280ms)
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- 允许光标在行首/行尾时跨行移动
-- h,l: 普通模式下 h/l 可跨行
-- <,>: 普通/可视模式下 左/右箭头 可跨行
-- [,]: 插入模式下 左/右箭头 可跨行
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- 默认开启自动换行
vim.opt.wrap = true
