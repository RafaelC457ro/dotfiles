return {
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            sources = {
                default = function()
                    return {"lsp", "snippets", "buffer"}
                end
            }
        },
        opts_extend = {"sources.default"}
    }
}
