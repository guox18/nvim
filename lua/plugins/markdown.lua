-- Markdown / LaTeX 行内渲染
-- markview.nvim:在 markdown buffer 里把 **粗体**、[链接]、表格、以及 $...$ / $$...$$
-- 数学公式渲染成可读形式(\alpha→α、上下标、\frac、\sqrt 等,内置 Unicode 替换,无需外部依赖)。
-- hybrid 模式:光标所在行显示原始源码,其余行显示渲染结果——即“移开就美化、移上去还原”。
--
-- 默认关闭渲染(preview.enable = false),只在需要看公式时用 <leader>um 手动打开。
return {
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "markdown_inline", "tex" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      -- 切换当前 buffer 的渲染(默认关闭,看公式时按一下打开,再按一下还原为源码)
      { "<leader>um", "<cmd>Markview toggle<cr>", desc = "Toggle Markview 渲染(公式/markdown)" },
    },
    opts = {
      preview = {
        enable = false, -- 默认不自动渲染,保持纯源码;用 <leader>um 手动开关
        modes = { "n", "no", "c" },
        hybrid_modes = { "n" }, -- 普通模式下:光标行显原文,其余行渲染
      },
    },
  },

  -- 确保 markview 渲染数学/markdown 所需的 treesitter parser 已安装
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "latex" })
    end,
  },
}
