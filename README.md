<h1 align="center">Gruvbox GTK Theme</h1>
<p align="center">
  <img = src="https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=yelow"/>
    <img src="https://img.shields.io/badge/Style-CSS-blue?style=for-the-badge&logo=css3&logoColor=blue"/>
  <img src="https://img.shields.io/github/stars/Fausto-Korpsvart/Gruvbox-GTK-Theme?&style=for-the-badge&logoColor=red" />
  <img src="https://img.shields.io/github/forks/Fausto-Korpsvart/Gruvbox-GTK-Theme?style=for-the-badge" />
  <img src="https://img.shields.io/github/issues/Fausto-Korpsvart/Gruvbox-GTK-Theme?style=for-the-badge" />
  <img src='https://img.shields.io/github/license/Fausto-Korpsvart/Gruvbox-GTK-Theme?style=for-the-badge&logo=GNU&label=License&color=bd0000&logoColor=white'/>
</p>

> A GTK theme based on the colours of [Sainnhe's](https://github.com/sainnhe) great theme: [Gruvbox Material for Neovim](https://github.com/sainnhe/gruvbox-material), the [VinceLiuice's](https://github.com/vinceliuice) awesome: [Magnetic GTK theme](https://github.com/vinceliuice/Magnetic-gtk-theme) and the creativity of [Ggusbemacbe's](https://github.com/gusbemacbe): [Suru Plus Icon Theme](https://github.com/gusbemacbe/suru-plus).<br />
> Great to combine in your Gnome Desktop Environment and TWMs like: XmonadWM, AwesomeWM, BSPWM, etc...
> With support also for the desktop environments Cinnamon and XFCE.<br />
> You can check **Reddit:** [r/unixporn](https://www.reddit.com/r/unixporn/) to get some ideas.

![Gruvbox Dark](https://raw.githubusercontent.com/Fausto-Korpsvart/Gruvbox-GTK-Theme/master/extra/screenshoots/Gruvbox-2.png)

## Installing Themes

Before installing the themes, make sure to install the following necessary packages: `sassc` `murrine-engine` and `gnome-themes-extra` packages for the correct rendering of themes.

Here are some commands to install on some distributions:

* On Fedora run:

```
 sudo dnf install gtk-murrine-engine sassc
```

* On OpenSUSE run:

```
 sudo zypper install gtk2-engine-murrine sassc
```

* On Arch run:

```
sudo pacman -S gtk-engine-murrine sassc
```

* On Debian and derivatives run:

```
sudo apt install gtk2-engines-murrine sassc
```

The themes work on versions 40 to 46 of the GNOME D.E. just follow the steps below for installation:

* Download the [themes](https://www.pling.com/u/fkorpsvart) packs and extract them
* Move the extracted files to the following paths:
  * For GTK3: `~/.themes` In this path you must move the entire theme folder.
  * For GTK4: `~/.config/gtk-4.0` The files to move to this path can be found inside the theme directory in the `gtk-4.0` folder, copy only the `assets`, `gtk.css` and `gtk-dark.css` files or create a symlinks.

### Applying themes from zip files

* For GTK3, apply themes from **Gnome Tweaks**.
* For GTK4 applications it is only necessary to have moved the `assets`, `gtk.css` and `gtk-dark.css` files to the `~/.config/gtk-4.0` path, and if you notice that the theme has not been applied, just close and reopen the application.

### Applying themes to Flatpak applications

* Override flatpak themes to `~/.themes`:

```
sudo flatpak override --filesystem=$HOME/.themes
```

* Override flatpak icons to `~/.icons`:

```
sudo flatpak override --filesystem=$HOME/.icons
```

* Override flatpak themes to `~/.config/gtk-4.0` locally:

```
flatpak override --user --filesystem=xdg-config/gtk-4.0
```

* Override flatpak themes to `~/.config/gtk-4.0` globally:

```
sudo flatpak override --filesystem=xdg-config/gtk-4.0
```

##### Alternative Flatpak Theming: [stylepak](https://github.com/refi64/stylepak)

### Manual Installation

> Base theme default instructions

Run the following commands in the terminal:

```sh
./install.sh
```

> Tip: `./install.sh` allows the following options:

```
-d, --dest DIR          Specify destination directory (Default: ~/.themes)
-n, --name NAME         Specify theme name (Default: Tokyonight)
-t, --theme VARIANT...  Specify theme color variant(s) [default|purple|pink|red|orange|yellow|green|teal|grey|all] (Default: blue)
-c, --color VARIANT...  Specify color variant(s) [light|dark] (Default: All variants)
-s, --size VARIANT...   Specify size variant [standard|compact] (Default: standard variant)

-l, --libadwaita        Link installed gtk-4.0 theme to config folder for all libadwaita app use this theme

-r, --remove,
-u, --uninstall         Uninstall/Remove installed themes or links

--tweaks                Specify versions for tweaks
                        1. [medium|soft]       Medium|Soft| ColorSchemes version
                        2. black               Blackness color version
                        3. float               Floating gnome-shell panel style
                        4. outline             Windows with 2px outline style

-h, --help              Show help
```

> For more information, run: `./install.sh --help`

### Clarifying some doubts

This is just to clarify doubts about the abbreviations of the Themes, as many found the names confusing.

| Abbreviation example | Explanation of abbreviations                                   |
| -------------------- | -------------------------------------------------------------- |
| Theme-Name-B-MB      | Theme with `Border` decoration and `macOS Buttons` in Windows  |
| Theme-Name-B-LB      | Theme with `Border` decoration and `Legacy Buttons` in Windows |
| Theme-Name-B-GS      | Theme with `Border` decoration for `Gnome Shell`               |
| Theme-Name-BL-MB     | Theme `Borderless` decoration and `macOS Buttons` in Windows   |
| Theme-Name-BL-LB     | Theme `Borderless` decoration and `Legacy Buttons` in Windows  |
| Theme-Name-BL-GS     | Theme `Borderless` decoration for `Gnome Shell`                |

### Looking for other themes with Neovim colour schemes?

| Neovim Colorschemes for GTK   | Source                                                              | Package                                   |
| ----------------------------- | ------------------------------------------------------------------- | ----------------------------------------- |
| Catppuccin GTK Theme          | [Github](https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme)  | [Pling](https://www.pling.com/p/1715554/) |
| Everforest GTK Theme          | [Github](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme)  | [Pling](https://www.pling.com/p/1695467/) |
| Gruvbox Material GTK Theme    | [Github](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)     | [Pling](https://www.pling.com/p/1681313/) |
| Kanagawa GTK Theme            | [Github](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme)    | [Pling](https://www.pling.com/p/1810560/) |
| Material Deep Ocean GTK Theme | [Github](https://github.com/Fausto-Korpsvart/Material-GTK-Themes)   | [Pling](https://www.pling.com/p/1706139/) |
| Material Palenight GTK Theme  | [Github](https://github.com/Fausto-Korpsvart/Material-GTK-Themes)   | [Pling](https://www.pling.com/p/1706139/) |
| Nightfox Dusk GTK Theme       | [Github](https://github.com/Fausto-Korpsvart/Nightfox-GTK-Theme)    | [Pling](https://www.pling.com/p/1929101/) |
| Rosé Pine GTK Theme           | [Github](https://github.com/Fausto-Korpsvart/Rose-Pine-GTK-Theme)   | [Pling](https://www.pling.com/p/1810530/) |
| Tokyonight GTK Theme          | [Github](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme) | [Pling](https://www.pling.com/p/1681315/) |

### Special thanks.

Thanks to [@f1yn](https://github.com/f1yn) for the solution to the active and inactive borders in the new version of `Cinnamon` which no longer uses `Metacity`.

Thanks to [@telometto](https://github.com/telometto) for the alternative for the application of themes in `Flatpak`.

[Support](https://paypal.me/FKorpsvart)

###### **\<ENJOY IT!! :nerd\_face:/>**
