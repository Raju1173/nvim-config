require'nvim-treesitter'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "c", "cpp", "asm", "c_sharp", "rust", "javascript", "typescript", "python" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
