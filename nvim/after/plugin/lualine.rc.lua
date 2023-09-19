-- TODO: find a better config
local status, lualine = pcall(require, "lualine")
if (not status) then return end

local config = {
  options = {
    theme = "onedark"
  }
}

lualine.setup(config)
