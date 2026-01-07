-- OSC52 剪贴板支持（用于远程 SSH/Docker 环境）
return {
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
      require("osc52").setup({
        max_length = 0, -- 最大长度，0 表示无限制
        silent = false, -- 是否静默复制
        trim = false,   -- 是否去除首尾空白
      })

      -- 覆盖默认的 yank 行为，使用 OSC52
      local function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
          require("osc52").copy_register("")
        end
      end

      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = copy,
        desc = "Copy to system clipboard using OSC52",
      })
    end,
  },
}


