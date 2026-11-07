-- 离线机器上跳过 treesitter parser 自动安装
-- LazyVim 每次启动都会为缺失的 parser 调 curl 下载, 无外网时会刷一屏 "Couldn't connect to server"
-- 这里在有缺失 parser 时探测一次 GitHub, 不通则清空 ensure_installed, 结果缓存一天
-- 有网后可手动 :TSInstall <lang>, 或删除缓存文件强制重新探测
local offline_flag = vim.fn.stdpath("state") .. "/treesitter-offline"

local function is_offline()
  local stat = vim.uv.fs_stat(offline_flag)
  if stat and os.time() - stat.mtime.sec < 24 * 3600 then
    return true
  end
  local ok = vim.system({ "curl", "-sS", "-o", "/dev/null", "-m", "2", "https://github.com" }):wait().code == 0
  if ok then
    os.remove(offline_flag)
  else
    local f = io.open(offline_flag, "w")
    if f then
      f:close()
    end
  end
  return not ok
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local installed = require("nvim-treesitter").get_installed()
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, opts.ensure_installed or {})
      if #missing > 0 and is_offline() then
        opts.ensure_installed = {}
      end
    end,
  },
}
