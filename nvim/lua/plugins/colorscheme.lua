return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("everforest").setup({
			transparent_background_level = 1,
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
	end,
}
