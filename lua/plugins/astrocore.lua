-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        shiftwidth = 4, -- number of space inserted for indentation
        showtabline = 4, -- always display tabline
        tabstop = 4, -- number of space in a tab
        updatetime = 100,
        cursorline = false,
        background = "dark",
        -- background = "light",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- Normal mode
      n = {
        -- navigate buffer tabs
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- live server
        sl = { ":LiveServerStart<cr>", desc = "Run server ..." },
        ss = { ":LiveServerStop<cr>", desc = "Stop server" },

        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

        -- split window
        sh = { "<C-w>s", desc = "Split window" },
        sv = { "<C-w>v", desc = "Split window horizontal" },

        -- move window
        ["<leader>1"] = { ":vertical resize +8<cr>", desc = "Move split right" },
        ["<leader>2"] = { ":vertical resize -8<cr>", desc = "Move split left" },
        ["<leader>3"] = { ":resize +5<cr>", desc = "Move split up" },
        ["<leader>4"] = { ":resize -5<cr>", desc = "Move split down" },

        -- goto preview
        ld = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "LSP definition" },
        lt = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "LSP type definition" },
        li = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "LSP implementation" },
        lc = { "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "close preview" },
        lr = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "LSP references" },
        lp = { "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", desc = "LSP declaration" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },

      -- Visual mode
      v = {
        --  Movement -> or <-
        ["<"] = { "<gv", desc = "Indent left" },
        [">"] = { ">gv", desc = "Indent right" },

        --  Move lines up or down
        J = { ":move '>+1<CR>gv-gv", desc = "Move selection line down" },
        K = { ":move '<-2<CR>gv-gv", desc = "Move selection line up" },
      },

      -- Insert mode
      i = {
        jk = { "<ESC>", desc = "Scape" },
      },
    },
  },
}
