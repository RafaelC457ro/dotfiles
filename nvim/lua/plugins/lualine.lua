return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- override section lualine_z
    -- but keep all the config
    opts.options.section_separators = { left = "▒░", right = "░▒" }
    opts.sections.lualine_z = {}
  end,
}
