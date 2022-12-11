## Gruvbox themes for GTK

![Gruvbox Dark](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme/blob/master/screenshoots/gruvbox_dark.png)
**Gruvbox Dark**
![Gruvbox Light](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme/blob/master/screenshoots/gruvbox-light.png)
**Gruvbox Light**

---

## Small Description

<ins>**Gruvbox Material**</ins> is a GTK theme based on the colour palette of the [Gruvbox Material for Neovim](https://github.com/sainnhe/gruvbox-material) by [@Sainnhe](https://github.com/sainnhe), the [Graphite GTK theme](https://github.com/vinceliuice/Graphite-gtk-theme) by [@VinceLiuice](https://github.com/vinceliuice) and the [Suru Plus](https://github.com/gusbemacbe/suru-plus) icons by [@gusbemacbe.](https://github.com/gusbemacbe)

The idea was born from the need for **GTK** themes that match the most prominent colour palettes of **Neovim** code editor and **Tiling Window Manager**, such as **Xmonad**, **Awesome**, **DWM**, etc, which use these colour schemes to give a uniform and unique look to working environments. See on **Reddit:** [r/unixporn](https://www.reddit.com/r/unixporn/).

The colour palettes in this series of themes are the ones I have used the most in my setup for **Neovim**, **Xmonad** and **Gnome DE**, so creating themes started as something personal that I then decided to share thanks to several people asking me to share them because they seemed good, I hope you find them useful and make your desktops look good too.

## Installing Themes

Make sure `Murrine Engine` and `gnome-themes-extra` or `gnome-themes-standard` packages are already installed on your distro

The names might vary depending on your distro, for e.g: On Fedora it is: `gtk-murrine-engine`, OpenSUSE: `gtk2-engine-murrine`, Arch: `gtk-engine-murrine`, Debian and derivatives: `gtk2-engines-murrine`

Works in gnome 40, 41, 42, 43

**How to install:**

1) Download the file from [here](https://www.pling.com/p/1681313) (in the files tab)
2) unzip it
3) cd into the where-ever u installed it then ``cp -r Gruvbox* /usr/share/themes/``
4) ``mkdir ~/.config/gtk-4.0 && cp -r Gruvbox*/* ~/.config/gtk-4.0``
5) Get (and enable) the user-themes extension: https://extensions.gnome.org/extension/19/user-themes/
6) Download the "tweaks" or "gnome tweaks" app
7) in tweaks, under appearance>shell u can select gruvbox
8) in tweaks under appearance>legacy applications, u can select gruvbox

**If you use flatpak apps, u can also apply the theme to those:**

(make sure git is installed, it usually is by default)

1) ``git clone https://github.com/refi64/stylepak``
2) ``cd stylepak && ./style install-system NAME-OF-THEME-HERE``

the name of the theme is the exact name of the folder u downloaded, for example, Gruvbox-Dark-B-LB

## Clarifying some doubts.

Some people have told me that they find the names a bit complicated and confusing because of the abbreviations I have put next to the name of each theme.
I have abbreviated the themes because I don't like to put such long names like: **`Material-Deep-Ocean-Borderless-Legacy-Buttons-Gnome`**, Admittedly, it is a very explicit name, but it is a ridiculously long name. so I decided to abbreviate the different versions for each theme, like **`Tokyonight-Dark-BL-LB`**, so to clarify the abbreviations here is a small table.

| Abbreviation example | Explanation of abbreviations                                 |
| -------------------- | ------------------------------------------------------------ |
| Theme-Name-B         | Theme with `Border` decoration                               |
| Theme-Name-B-LB      | Theme with `Border` decoration and `Legacy Buttons` in Windows |
| Theme-Name-B-GS      | Theme with `Border` decoration for `Gnome Shell`             |
| Theme-Name-BL        | Theme `Borderless` decoration                                |
| Theme-Name-BL-LB     | Theme `Borderless` decoration and `Legacy Buttons` in Windows |
| Theme-Name-BL-GS     | Theme `Borderless` decoration for `Gnome Shell`              |

## More themes based on Neovim colour schemes.

| Neovim Colorschemes for GTK   | Source                                                       | Package                                   |
| ----------------------------- | ------------------------------------------------------------ | ----------------------------------------- |
| Catppuccin GTK Theme          | [Github](https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme) | [Pling](https://www.pling.com/p/1715554/) |
| Everforest GTK Theme          | [Github](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme) | [Pling](https://www.pling.com/p/1695467/) |
| Gruvbox Material GTK Theme    | [Github](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme) | [Pling](https://www.pling.com/p/1681313/) |
| Kanagawa GTK Theme            | [Github](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme) | [Pling](https://www.pling.com/p/1810560/) |
| Material Deep Ocean GTK Theme | [Github](https://github.com/Fausto-Korpsvart/Material-GTK-Themes) | [Pling](https://www.pling.com/p/1706139/) |
| Material Palenight GTK Theme  | [Github](https://github.com/Fausto-Korpsvart/Material-GTK-Themes) | [Pling](https://www.pling.com/p/1706139/) |
| Nightfox Dusk GTK Theme       | [Github](https://github.com/Fausto-Korpsvart/Nightfox-GTK-Theme) | [Pling](https://www.pling.com/p/1929101/) |
| Rosé Pine GTK Theme           | [Github](https://github.com/Fausto-Korpsvart/Rose-Pine-GTK-Theme) | [Pling](https://www.pling.com/p/1810530/) |
| Tokyonight GTK Theme          | [Github](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme) | [Pling](https://www.pling.com/p/1681315/) |

### Special thanks.

Thanks to [@f1yn](https://github.com/f1yn) for the solution to the active and inactive borders in the new version of `Cinnamon` which no longer uses `Metacity`.

Thanks to [@telometto](https://github.com/telometto) for the alternative for the application of themes in `Flatpak`.

## If you want to support

You can donate to support the development of these themes.

- [Donate in PayPal.Me](https://www.paypal.me/korpsvart)
- [PayPal Donation Page](https://www.paypal.com/donate/?hosted_button_id=LHKL2JYTUURVA)

#### **<ENJOY IT!! :nerd_face:/>
