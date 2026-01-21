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
