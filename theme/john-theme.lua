local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets
local bg_dark = '#1A1A1A'
local bg_light = '#212121'
local fg = '#99A3A3'
--local highlight = '#C6FF00'
local highlight = '#FF7042'

-- Primary
theme.primary = mat_colors.orange --mat_colors.indigo
theme.primary.hue_500 = highlight --'#003f6b'
-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.grey --.blue_grey

theme.background.hue_800 = bg_dark --'#192933' 
theme.background.hue_900 = bg_light --'#121e25R'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
