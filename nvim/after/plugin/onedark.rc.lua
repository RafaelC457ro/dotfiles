-- atom theme one dark
local status, onedark_theme = pcall(require,"onedark")
if (not status) then return end

onedark_theme.setup { style = 'dark',
  transparent = true
}

onedark_theme.load()

