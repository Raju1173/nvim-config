local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
	"--query-driver=/usr/bin/g++-13,/usr/bin/g++,/usr/bin/clang++",
	"--header-insertion=iwyu",
        "--completion-style=detailed",
    },
    capabilities = capabilities,
})

vim.lsp.enable('clangd')
