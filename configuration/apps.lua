local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    editor = 'code',
    rofi = 'rofi -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    lock = 'i3lock-fancy-rapid 5 3 -k --timecolor=ffffffff --datecolor=ffffffff',
    quake = 'alacritty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
    'xcalib -d :0 /usr/share/color/icc/HUAWEI_MateBook_X_Pro_8550u_LPM139M422A.icm', -- color profile
    'compton --config ' .. filesystem.get_configuration_dir() .. '/conf/compton.conf',
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager,
    'variety'
  }
}

--'/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)' -- credential manager
