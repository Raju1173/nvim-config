vim.g.mapleader = " "

vim.keymap.set({"n", "i"}, "<C-f>", function() require("nvim-tree.api").tree.toggle() end)
vim.keymap.set({"n", "i"}, "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")

vim.keymap.set("i", "<C-z>", "<C-o>u")
vim.keymap.set("i", "<C-r>", "<C-o><C-r>")

vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-x>", '"+d')
vim.keymap.set("i", "<C-d>", "<Esc>yyp`^i")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>")

--lsp
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)

	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

	vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
	vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)
    end,
})

--bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>")

--undotree
vim.keymap.set({"n", "i"}, "<leader><C-z>", vim.cmd.UndotreeToggle)

--fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
