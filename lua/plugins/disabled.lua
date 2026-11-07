-- 性能优化: 关掉用不到或在远程终端上会拖慢手感的功能
return {
  -- 接管 cmdline/消息 UI, 远程终端上重绘开销大, 是常见卡顿来源
  { "folke/noice.nvim", enabled = false },
  -- HTML/JSX 标签自动闭合, 用不到
  { "windwp/nvim-ts-autotag", enabled = false },
  -- 实际用 catppuccin, tokyonight 只是 LazyVim 默认配色
  { "folke/tokyonight.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      -- 平滑滚动动画, 通过 ssh 时 <C-d>/<C-u> 会有拖滞感
      scroll = { enabled = false },
      -- 缩进线的展开动画
      indent = { animate = { enabled = false } },
    },
  },
}
