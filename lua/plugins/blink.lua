-- 修改 blink.cmp 补全快捷键：用回车确认补全，Tab 留给 AI 提示
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- 回车确认补全（如果有选中项则确认，否则换行）
      ["<CR>"] = { "select_and_accept", "fallback" },
      -- Tab 保留默认行为，留给 AI 提示使用
      ["<Tab>"] = { "fallback" },
      -- Shift-Tab 选择上一个
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}

