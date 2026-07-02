vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.cpp", "*.h", "*.hpp" },
    callback = function()
        local view = vim.fn.winsaveview()
        
        vim.cmd([[silent! %!clang-format --style="{BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never, BreakBeforeBraces: Custom, BraceWrapping: {AfterClass: true, AfterControlStatement: Always, AfterEnum: true, AfterFunction: True, AfterNamespace: true, AfterStruct: true, AfterUnion: true, BeforeCatch: true, BeforeElse: true, BeforeLambdaBody: false}, IndentCaseLabels: true, ColumnLimit: 100000, ReflowComments: false, SortIncludes: Never, AllowShortIfStatementsOnASingleLine: Never, AllowShortLoopsOnASingleLine: false, AllowShortFunctionsOnASingleLine: Inline, AllowShortBlocksOnASingleLine: Never, AllowShortLambdasOnASingleLine: All, IndentAccessModifiers: false, AccessModifierOffset: -4, ConstructorInitializerAllOnOneLineOrOnePerLine: true, PackConstructorInitializers: CurrentLine, IndentCaseBlocks: true}"]])


        if vim.v.shell_error ~= 0 then
            vim.cmd("undo")
        end
        
        vim.fn.winrestview(view)
    end,
})
