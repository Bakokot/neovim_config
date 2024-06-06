-- This is used for my LSP configuration to improve the usability of the LSP server API

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls" },
})

-- This is the config of the LSP plugin that makes me have the snippets from the lsp server


--local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup {
--	capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {
--	capabilities = capabilities,
}
