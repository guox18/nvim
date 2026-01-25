-- 覆盖 LazyVim 的 mini.ai 配置
-- 把 `e` 文本对象改为 entire buffer（全文）
-- 用法: vae 选中全文, yae 复制全文, dae 删除全文, cie 清空全文并进入插入模式
return {
  {
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      opts.custom_textobjects = opts.custom_textobjects or {}
      -- e = entire buffer（覆盖 LazyVim 默认的 "Word with case"）
      opts.custom_textobjects.e = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line("$"),
          col = math.max(vim.fn.getline("$"):len(), 1),
        }
        return { from = from, to = to, vis_mode = "V" }
      end
    end,
  },
}
