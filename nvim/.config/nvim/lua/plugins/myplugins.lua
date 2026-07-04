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
    init = function()
      vim.filetype.add({
        extension = {
          ixx = "cpp",
        },
      })
    end,
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        clangd = require("esp32").lsp_config(),
      },
    },
  },

  {
    "smnatale/coderabbit.nvim",
    opts = {},
  },
}
