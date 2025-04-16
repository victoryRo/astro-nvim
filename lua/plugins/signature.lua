return {
  ---- presence
  "andweeb/presence.nvim",

  ---- signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()   require("lsp_signature").setup() end,
  },
}
