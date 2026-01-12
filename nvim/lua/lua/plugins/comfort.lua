return {
    {
        "conform.nvim",
        opts = function(_, opts)
            if LazyVim.has_extra("formatting.prettier") then
                opts.formatters_by_ft = opts.formatters_by_ft or {}
                opts.formatters_by_ft.astro = {"prettier"}
                opts.formatters_by_ft.markdown = {
                    "prettier", "markdownlint-cli2", "markdown-toc"
                }
                opts.formatters_by_ft["markdown.mdx"] = {
                    "prettier", "markdownlint-cli2", "markdown-toc"
                }
            end

            opts.formatters = opts.formatters or {}
            opts.formatters["markdown-toc"] = {
                condition = function(_, ctx)
                    for _, line in ipairs(
                                       vim.api.nvim_buf_get_lines(ctx.buf, 0,
                                                                  -1, false)) do
                        if line:find("<!%-%- toc %-%->") then
                            return true
                        end
                    end
                end
            }
            opts.formatters["markdownlint-cli2"] = {
                condition = function(_, ctx)
                    local diag = vim.tbl_filter(function(d)
                        return d.source == "markdownlint"
                    end, vim.diagnostic.get(ctx.buf))
                    return #diag > 0
                end
            }
        end
    }
}
