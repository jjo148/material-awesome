local awful = require('awful')
local filesystem = require('gears.filesystem')

os.execute("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)")
os.execute("xcalib -d :0 /usr/share/color/icc/HUAWEI_MateBook_X_Pro_8550u_LPM139M422A.icm")

awful.spawn.single_instance({'blueberry-tray'}) -- Bluetooth tray icon
awful.spawn.single_instance({'xfce4-power-manager'}) -- Power manager
awful.spawn.single_instance('compton --config ' .. filesystem.get_configuration_dir() .. '/conf/compton.conf')
awful.spawn.single_instance('variety')

-- run_once({'pamac-tray'})
