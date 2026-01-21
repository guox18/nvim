-- Flash.nvim 配置（类似 EasyMotion）
return {
  "folke/flash.nvim",
  keys = {
    -- 禁用默认的 s 键映射
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },

    -- 将搜索功能移到 r 键
    {
      "r",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "R",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },

    -- 空格触发单字符跳转（类似 EasyMotion 的 overwin-f）
    {
      "<Space>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = {
            mode = "exact",
            max_length = 1, -- 只需输入一个字符
          },
          label = {
            style = "overlay", -- 标签直接覆盖在匹配字符上
            after = { 0, 0 },  -- 标签位置：直接覆盖匹配字符
          },
        })
      end,
      desc = "Flash single char (like EasyMotion)",
    },
  },
  opts = {
    -- 开启智能大小写匹配
    search = {
      mode = "fuzzy",
    },
    label = {
      -- 使用更容易按到的键
      uppercase = false,
      -- 标签直接覆盖在匹配字符上（类似 EasyMotion）
      style = "overlay",
    },
    modes = {
      char = {
        -- 禁用 f/F/t/T 的 flash 增强，保持原生行为
        -- 如果你想保留可以注释掉这行
        -- enabled = false,
      },
    },
  },
}

