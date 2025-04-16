-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "gopls",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "emmet-ls",
        "lua-language-server",
        "dockerfile-language-server",

        -- install formatters
        "stylua",

        -- install debuggers

        -- install linters
        "kube-linter",
        "selene",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
