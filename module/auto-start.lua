-- MODULE AUTO-START
-- Run all the apps listed in configuration/apps.lua as run_on_start_up only once when awesome start

local awful = require('awful')
local apps = require('configuration.apps')

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))
end

os.execute("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)")
os.execute("xcalib -d :0 /usr/share/color/icc/HUAWEI_MateBook_X_Pro_8550u_LPM139M422A.icm")

awful.spawn.single_instance({'blueberry-tray'}) -- Bluetooth tray icon
awful.spawn.single_instance({'xfce4-power-manager'}) -- Power manager
awful.spawn.single_instance('compton --config ' .. filesystem.get_configuration_dir() .. '/conf/compton.conf')
awful.spawn.single_instance('variety')

-- run_once({'pamac-tray'})
for _, app in ipairs(apps.run_on_start_up) do
  run_once(app)
end
