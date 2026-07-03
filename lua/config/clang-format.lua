vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.cpp", "*.h", "*.hpp" },
    callback = function()
        local file = vim.fn.expand("%:p")

        local result = vim.system({"clang-format", "-i", "--style=file", "--assume-filename=" .. file, file}):wait()

        if result.code ~= 0 then
            vim.notify(
                "clang-format failed:\n" .. (result.stderr or ""),
                vim.log.levels.ERROR
            )
            return
        end

        vim.cmd("checktime")
    end,
})
