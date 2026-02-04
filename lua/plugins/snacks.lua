-- 将 snacks explorer 文件浏览器移动到右侧
return {
  "folke/snacks.nvim",
  opts = {
    -- 禁用 image 功能，避免在不支持的终端中显示 "SIXEL IMAGE" 提示
    image = {
      enabled = false,
    },
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "right",
            },
          },
        },
      },
    },
  },
}

