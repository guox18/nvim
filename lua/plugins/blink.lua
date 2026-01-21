-- 修改 blink.cmp 补全快捷键：用 Tab 确认补全
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- Tab 确认补全（如果有选中项则确认，否则插入 Tab）
      ["<Tab>"] = { "select_and_accept", "fallback" },
      -- Shift-Tab 选择上一个
      ["<S-Tab>"] = { "select_prev", "fallback" },
      -- 保留回车的默认行为（换行）
      ["<CR>"] = { "fallback" },
    },
  },
}

