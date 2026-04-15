return {
  {
    "Aietes/esp32.nvim",
    --{
    --opts = {
    --build_dir = "build.clang",
    --clangd_args = {
    --  "--query-driver=**",
    --},
    --},
    --keys = {
    --{
    --"<leader>em",
    --function()
    --require("esp32").pick("monitor")
    --end,
    --desc = "ESP32: Pick & Monitor",
    --},
    --},
    --},
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.clangd = require("esp32").lsp_config()
      return opts
    end,
  },
}
