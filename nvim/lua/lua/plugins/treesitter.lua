return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, {"markdown"})
            end
            vim.treesitter.language.register("markdown", "mdx")

            opts.indent = {enable = true} ---@type lazyvim.TSFeat
            opts.highlight = {enable = true} ---@type lazyvim.TSFeat
            opts.folds = {enable = true} ---@type lazyvim.TSFeat
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "bash", "c", "diff", "html", "javascript", "jsdoc", "json",
                "jsonc", "lua", "luadoc", "luap", "markdown", "markdown_inline",
                "printf", "python", "query", "regex", "toml", "tsx",
                "typescript", "vim", "vimdoc", "xml", "yaml", "astro", "css"
            })
        end
    }
}
