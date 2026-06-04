# russian-phonetic-les
Consistent, cross-platform phonetic keyboard layout available for Windows, Mac OS and Linux

https://lvsovoy.github.io/russian-phonetic-les/

# INSTALLATION GUIDE - MAC
Place .bundle in Mac Disk > Library > Keyboard Layouts folder

- Go to the Keyboard pane in System Preferences
- Select the Input Sources tab
- Click the + button on the bottom left
- Select Russian
- Choose Russian – Phonetic language layout

If there are more than one phonetic layout, check the layout images and find the one that is the same as the ones in about page

# INSTALLATION GUIDE - WINDOWS
WINDOWS 8 – 10:
Go to Settings > Time & language > Region & language.

- Press Add a Language and select Русский
- Press on Русский in the language list > Options
- Press Add a Keyboard and select Russian – Phonetic – Les
 

WINDOWS 7 AND OLDER:
Open Control Panel > Clock, Language, and Region > Region and Language.

- Click the Keyboards and Languages tab, and then click Change keyboards
- Under Installed services, click Add
- Select Russian, click Keyboard, select Russian – Phonetic – Les, and then click OK

# INSTALLATION GUIDE - LINUX

AUTOMATIC INSTALL (clone + install + activate):
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lvsovoy/russian-phonetic-les/master/release/1.2/linux/install-linux.sh)"
```

What it does:
- clones (or updates) this repository into `~/.local/src/russian-phonetic-les`
- copies `release/1.2/linux/ru_les` to `/usr/share/X11/xkb/symbols/ru_les`
- appends (or refreshes) compose rules in `~/.XCompose`
- runs `setxkbmap ru_les` to activate layout immediately

MANUAL INSTALL:
- Copy layout file `ru_les` to `/usr/share/X11/xkb/symbols/ru_les`
- Append `russian-phonetic-les.XCompose` snippet to your `~/.XCompose` file
```
sudo cp ru_les /usr/share/X11/xkb/symbols/ru_les
cat russian-phonetic-les.XCompose >> ~/.XCompose
setxkbmap ru_les          # activate immediately
```
