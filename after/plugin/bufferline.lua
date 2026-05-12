require("bufferline").setup({
    options = {
        mode = "buffers", -- Shows open files
        separator_style = "slant", -- Cool angled tabs
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        offsets = {
            {
                filetype = "nvim-tree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
    }
})
