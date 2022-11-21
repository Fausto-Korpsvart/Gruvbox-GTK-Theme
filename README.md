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

Before applying the themes you need to check if the `Murrine Engine` and `gnome-themes-extra` or `gnome-themes-standard` packages are already installed on your distro, as it is necessary for the correct rendering of the themes.
Depending on your Linux distro, the package may have a different name, here are the package names in some distro: On Fedora: `gtk-murrine-engine`, OpenSUSE: `gtk2-engine-murrine`, Arch: `gtk-engine-murrine`, Debian and derivatives: `gtk2-engines-murrine`

Themes work in <ins>**Gnome 40, 41 and 42 versions**,</ins> but since Gnome 42 introduced [<ins>**libadwaita**</ins>](https://en.wikipedia.org/wiki/Adwaita_(design_language)) the themes files for <ins>**GTK4**</ins> applications must be placed in a new directory in a new path: **`'~/.config/gtk-4.0'`** with the name **`'gtk.css'`**; this will apply the themes automatically without use **Gnome Tweaks** but, for **GTK3** applications, we must always use **Tweaks** as we have done so far.

To install the [themes](https://www.pling.com/u/fkorpsvart) you will need to download the theme pack of your choice and place it in the following path.
`~/.themes`; for themes in `Gnome 43` there is no longer a separate stylesheet, you can create a symlink for the files inside the `gtk-4.0` folder which is inside the theme package, or just copy the files inside the `gtk-4.0` folder into the `~/.config/gtk-4.0` path.

As I mentioned before, the **GTK4** themes don't need to be applied with **Tweaks**, they are applied automatically but, if you have applications open you will have to close and open them for the theme to be applied, but for GTK3 applications you do need to apply them with **Tweaks**, as usual.

## Flatpak

To apply themes to Flatpak applications you need to run a few commands from the terminal to give Flatpak applications permissions to override the default themes and apply the GTK theme you are using, the commands are: `flatpak override --user --filesystem=xdg-config/gtk-4.0`, to do it locally, and `flatpak override --filesystem=xdg-config/gtk-4.0` to do it globally.

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

## If you want to support

You can donate to support the development of these themes.

- [Donate in PayPal.Me](https://www.paypal.me/korpsvart)
- [PayPal Donation Page](https://www.paypal.com/donate/?hosted_button_id=LHKL2JYTUURVA)

#### **<ENJOY IT!! :nerd_face:/>
