return {
  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall",
    config = function()
      local srv = require "live-server-nvim"
      srv.setup {
        custom = {
          "--port=8080",
          "--no-css-inject",
        },
        serverPath = vim.fn.stdpath "data" .. "/live-server/", --default
        open = "folder", -- folder|cwd     --default
      }
    end,
  },
}
