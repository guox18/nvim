-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 窗口最大化 toggle（Ctrl+w z）
-- 使用 winrestcmd() 保存整个窗口布局，恢复时所有窗口（包括文件浏览器）都能正确恢复
local window_maximized = false
local saved_win_layout = nil

local function toggle_maximize_window()
  if window_maximized then
    -- 恢复整个窗口布局
    if saved_win_layout then
      vim.cmd(saved_win_layout)
    end
    window_maximized = false
    saved_win_layout = nil
    vim.notify("Window restored", vim.log.levels.INFO)
  else
    -- 保存整个窗口布局命令（包括所有窗口的精确尺寸）
    saved_win_layout = vim.fn.winrestcmd()
    vim.cmd("wincmd _") -- 最大高度
    vim.cmd("wincmd |") -- 最大宽度
    window_maximized = true
    vim.notify("Window maximized", vim.log.levels.INFO)
  end
end

vim.keymap.set("n", "<C-w>z", toggle_maximize_window, { desc = "Toggle Maximize Window" })
vim.keymap.set("n", "<C-w><C-z>", toggle_maximize_window, { desc = "Toggle Maximize Window" })

-- gi = Goto Implementation（覆盖原生的"跳到上次插入位置并进入插入模式"）
vim.keymap.set("n", "gi", function()
  require("snacks").picker.lsp_implementations()
end, { desc = "Goto Implementation" })

-- 恢复 s 的原始功能（删除字符并进入插入模式）
vim.keymap.set({ "n", "x" }, "s", "s", { desc = "Substitute" })

-- 恢复 S 的原始功能（删除整行并进入插入模式）
vim.keymap.set("n", "S", "S", { desc = "Substitute line" })

-- 用 Option + 上下箭头 移动行（替代 Option + j/k）
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
vim.keymap.set("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })

-- Emacs 风格的 Insert 模式快捷键
vim.keymap.set("i", "<C-a>", "<Home>", { desc = "Go to beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Go to end of line" })
vim.keymap.set("i", "<C-k>", "<C-o>D", { desc = "Kill to end of line" })
vim.keymap.set("i", "<C-u>", "<C-o>d0", { desc = "Kill to beginning of line" })
vim.keymap.set("i", "<A-d>", "<C-o>dw", { desc = "Delete word forward" })
vim.keymap.set("i", "<C-_>", "<C-o>u", { desc = "Undo" })

-- macOS 风格：Option + 左/右 按单词移动（Insert 模式）
-- 不同终端可能发送不同的键码，所以同时映射多种形式
vim.keymap.set("i", "<A-Left>", "<C-Left>", { desc = "Move word left" })
vim.keymap.set("i", "<A-Right>", "<C-Right>", { desc = "Move word right" })
-- 禁用 Normal 模式下的 Option + 左/右（用 b/w/e 移动）
vim.keymap.set("n", "<A-Left>", "<Nop>")
vim.keymap.set("n", "<A-Right>", "<Nop>")
vim.keymap.set("i", "<M-Left>", "<C-Left>", { desc = "Move word left" })
vim.keymap.set("i", "<M-Right>", "<C-Right>", { desc = "Move word right" })
-- iTerm2 / 某些终端使用 Esc 序列：Esc+b 和 Esc+f
vim.keymap.set("i", "<Esc>b", "<C-Left>", { desc = "Move word left" })
vim.keymap.set("i", "<Esc>f", "<C-Right>", { desc = "Move word right" })
