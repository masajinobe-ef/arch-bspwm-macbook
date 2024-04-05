# BSPWM ARCH

<p align="center">
  <img width="100%" src="readme.png" alt="readme"/>
</p>

My **BSPWM** Configuration files for **Macbook Air 2011**

## Infomation

|       OS       |                    [Arch Linux](https://archlinux.org/)                     |
| :------------: | :-------------------------------------------------------------------------: |
|   AUR Helper   |                     [yay](https://github.com/Jguer/yay)                     |
|     Shell      |                       [Fish](https://fishshell.com/)                        |
| Window Manager |                [BSPWM](https://github.com/baskerville/bspwm)                |
|      Bar       |                [Polybar](https://github.com/polybar/polybar)                |
|      Menu      |                [dmenu2](https://github.com/muff1nman/dmenu2)                |
|    Terminal    |                [Kitty](https://github.com/kovidgoyal/kitty)                 |
|  File Manager  |        [Thunar](https://archlinux.org/packages/extra/x86_64/thunar)         |
|    Browser     |      [Chromium](https://archlinux.org/packages/extra/x86_64/chromium)       |
|  Text Editor   | [VS Code / nano](https://aur.archlinux.org/packages/visual-studio-code-bin) |
|     Theme      |           [Tokyo Night GTK](https://www.gnome-look.org/p/1681315)           |

## Installation

### AUR Helper

The initial installation of Yay

```sh
sudo pacman -Syu --needed nano git base-devel
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si
cd && rm -rf yay
```

#### MAKEPKG

Speed up compiling of AUR packages

```sh
sudo nano /etc/makepkg.conf

MAKEFLAGS="-j4"
```

#### Pacman setting-up

Parallel downloading of packages

```sh
sudo nano /etc/pacman.conf

ParallelDownloads = 5
```

---

#### Installing packages

> Assuming your **AUR Helper** is [yay](https://github.com/Jguer/yay).

```sh
yay -S --needed \
  xorg xorg-xinit xorg-xrdb \
  bspwm sxhkd polybar dmenu feh kitty fish dunst \
  acpid brightnessctl \
  thunar xdg-user-dirs xfce-polkit tumbler lxappearance-gtk3 \
  visual-studio-code-bin nano \
  mpv ffmpeg ffmpegthumbnailer \
  telegram-desktop qbittorrent discord chromium \
  fastfetch btop lsd fzf fd bat maim xdotool xclip reflector \
  p7zip zip unrar unzip \
  ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji noto-fonts-cjk papirus-icon-theme \
  mesa xf86-video-intel xf86-input-libinput \
  bluez bluez-utils blueman \
  networkmanager nm-connection-editor network-manager-applet \
  remmina freerdp \
  efibootmgr
  && fc-cache -fv
```

#### Copy configuration files

```sh
git clone https://github.com/masajinobe-ef/arch-bspwm-macbook

# /.config
mkdir -p $HOME/.config && cp -r $HOME/arch_bspwm_macbook/config/* $HOME/.config
# /.local/bin
mkdir -p $HOME/.local/bin && cp -r $HOME/arch_bspwm_macbook/bin/* $HOME/.local/bin

# Make executable
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/polybar.sh

# Misc
cp -r $HOME/arch-bspwm-macbook/misc/* $HOME
```

#### Daemons

```sh
sudo systemctl enable acpid.service --now
sudo systemctl enable bluetooth.service --now
sudo systemctl enable NetworkManager.service --now
```

---

#### Setting-up

Adding language

```sh
sudo nano /etc/locale.gen

ru_RU.UTF-8 UTF-8

sudo locale-gen
```

Configure keyboard layout in Xorg

```sh
sudo localectl --no-convert set-x11-keymap us,ru pc105+inet qwerty grp:alt_shift_toggle
```

Config touchpad

```sh
sudo nano /etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "NaturalScrolling" "true"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
    Option "ClickMethod" "clickfinger"
    Option "AccelProfile" "flat"
    Option "TransformationMatrix" "1 0 0 0 1 0 0 0 0.8"
EndSection
```

Config mouse

```sh
sudo nano /etc/X11/xorg.conf.d/30-pointer.conf

Section "InputClass"
    Identifier "pointer"
    Driver "libinput"
    MatchIsPointer "on"
    Option "NaturalScrolling" "false"
    Option "AccelProfile" "flat"
    Option "TransformationMatrix" "1 0 0 0 1 0 0 0 1.2"
EndSection
```

Config macbook keyboard

```sh
sudo nano /etc/modprobe.d/hid_apple.conf

options hid_apple fnmode=2 iso_layout=1

sudo mkinitcpio -P
```

Config vconsole

```sh
sudo nano /etc/vconsole.conf

XKBLAYOUT=us,ru
XKBMODEL=pc105+inet
XKBOPTIONS=grp:alt_shift_toggle
XKBVARIANT=qwerty
KEYMAP=us
FONT=cyr-sun16
USECOLOR=yes
```

Config GRUB

```sh
sudo nano /etc/default/grub

GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 mitigations=off splash"

sudo grub-mkconfig -o /boot/grub/grub.cfg
```

---

#### Other

Vencord (Discord)

```sh
# bash
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
```

Fisher (Fish)

```sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Fish Plugins List:

```sh
jorgebucaran/fisher
jethrokuan/z
patrickf1/fzf.fish
franciscolourenco/done
jorgebucaran/autopair.fish
nickeb96/puffer-fish
ramlev/mkcd
meaningful-ooo/sponge
ilancosman/tide@v6
```

## Shortcuts

|                     Shortcuts                     |                          sxhkd                           |
| :-----------------------------------------------: | :------------------------------------------------------: |
|                  Super + Return                   |                         Terminal                         |
|                     Super + R                     |                     Application menu                     |
|                 Super + W/E/T/D/C                 |        Chromium, Thunar, Telegram, Discord, Code         |
|                       Print                       |                    Take a screenshot                     |
|                 Super + Shift + S                 |              Take a screenshot to clipboard              |
|                   Ctrl + Print                    |             Take screenshot of active window             |
|                 Ctrl + Shift + S                  |                 Take screenshot of area                  |
|                  Super + Escape                   |                    Reload Keybindings                    |
|                  Super + Alt + Q                  |                        Quit bspwm                        |
|                  Super + Alt + R                  |                      Restart bspwm                       |
|                     Super + Q                     |                        Close app                         |
|                 Super + Shift + Q                 |                         Kill app                         |
|                     Super + S                     |                 Tiled or Monocle switch                  |
|                Super + Ctrl + 1-9                 |                   Preselect the ratio                    |
|                   Super + ' ; /                   |           Split horizontal, vertical or cancel           |
| Super + (Shift) + Left/Down/Up/Right (or H/J/K/L) | Select and Send the window to another edge of the screen |
|                    super + { }                    |                     Switch workspace                     |
|                Alt + (Shift) + Tab                |  Change focus to next window, including floating window  |
|               Super + (Shift) + 1-5               |         Send focused window to another workspace         |
|       Super + Control + Left/Right/Up/Down        |                    Expanding windows                     |
|         Super + Alt + Left/Right/Up/Down          |                    Shrinking windows                     |
