-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 恢复 s 的原始功能（删除字符并进入插入模式）
vim.keymap.set({ "n", "x" }, "s", "s", { desc = "Substitute" })

-- 恢复 S 的原始功能（删除整行并进入插入模式）
vim.keymap.set("n", "S", "S", { desc = "Substitute line" })
