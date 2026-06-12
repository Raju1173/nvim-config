vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.cpp", "*.h", "*.hpp" },
    callback = function()
        local view = vim.fn.winsaveview()
        
        vim.cmd([[%!clang-format --style="{BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never, BreakBeforeBraces: Allman, IndentCaseLabels: true, ColumnLimit: 0, ReflowComments: false, SortIncludes: Never, AllowShortIfStatementsOnASingleLine: Never, AllowShortLoopsOnASingleLine: false, AllowShortFunctionsOnASingleLine: None, AllowShortBlocksOnASingleLine: Never}"]])

        if vim.v.shell_error ~= 0 then
            vim.cmd("undo")
        end
        
        vim.fn.winrestview(view)
    end,
})
