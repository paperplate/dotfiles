# Bluetooth
For xbox controllers to work:
1. Go to `/etc/bluetooth/main.conf` an set `Privacy = device`.
2. clone and install https://github.com/atar-axis/xpadneo

# Chinese input
1. Install `fcitx5-gtk fcitx5-chinese-addons fcitx5-nord fcitx5-configtool`
2. Open config tool and search `cn`, then `Pinyin`.
3. Set input switch method.

# Accessing serial
Add the following to `/etc/udev/rules.d/01-ttyusb.rules`
`
ACTION!="remove", SUBSYSTEMS=="usb-serial", TAG+="uaccess"
ACTION!="remove", SUBSYSTEMS=="tty", TAG+="uaccess"`
