-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- local lspconfig = require "lspconfig"

local servers = {
  html = {},
  cssls = {},
  lua_ls = {},
  tsserver = {},
  tailwindcss = {},
  eslint = {},
  emmet_language_server = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "off",
        },
        disableOrganizeImports = true,
        autoImportCompletions = true, -- Enable auto imports
        inlayHints = { -- Enable inlay hints
          enabled = true,
          parameterHints = true,
          typeHints = true,
          chainingHints = true,
          otherHints = true,
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = on_attach
  opts.capabilities = capabilities

  require("lspconfig")[name].setup(opts)
end
