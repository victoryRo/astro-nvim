return {
  -- ================================ Adding Themes =================================

  -- github theme
  { "projekt0n/github-nvim-theme" },

  -- monokai theme
  { "tanvirtin/monokai.nvim" },

  -- zephyrium
  {
    "titanzero/zephyrium",
    config = function()
      -- vim.cmd [[colorscheme zephyrium]]
    end
  },

  -- nordic theme
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
  },

  -- miasma theme
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'dark' -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      }
      require('onedark').load()
    end
  },

  -- onenord
  { "rmehri01/onenord.nvim" },

  -- gruvbox
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_foreground = 'original' -- 'original' | 'mix'
      -- vim.g.gruvbox_material_background = 'hard' -- 'hard' | 'medium' | 'soft'
    end
  },
}
