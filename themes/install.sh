#! /usr/bin/env bash

set -Eeo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
SRC_DIR="${REPO_DIR}/src"

source "${REPO_DIR}/gtkrc.sh"

ROOT_UID=0
DEST_DIR=

ctype=
window=

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
    DEST_DIR="/usr/share/themes"
else
    DEST_DIR="$HOME/.themes"
fi

SASSC_OPT="-M -t expanded"

THEME_NAME=Gruvbox
THEME_VARIANTS=('' '-Green' '-Grey' '-Orange' '-Pink' '-Purple' '-Red' '-Teal' '-Yellow')
COLOR_VARIANTS=('-Light' '-Dark')
SIZE_VARIANTS=('' '-Compact')

if [[ "$(command -v gnome-shell)" ]]; then
    echo && gnome-shell --version && echo
    SHELL_VERSION="$(gnome-shell --version | cut -d ' ' -f 3 | cut -d . -f -1)"
    if [[ "${SHELL_VERSION:-}" -ge "48" ]]; then
        GS_VERSION="48-0"
    elif [[ "${SHELL_VERSION:-}" -ge "47" ]]; then
        GS_VERSION="47-0"
    elif [[ "${SHELL_VERSION:-}" -ge "46" ]]; then
        GS_VERSION="46-0"
    elif [[ "${SHELL_VERSION:-}" -ge "44" ]]; then
        GS_VERSION="44-0"
    elif [[ "${SHELL_VERSION:-}" -ge "42" ]]; then
        GS_VERSION="42-0"
    elif [[ "${SHELL_VERSION:-}" -ge "40" ]]; then
        GS_VERSION="40-0"
    else
        GS_VERSION="3-28"
    fi
else
    echo "'gnome-shell' not found, using styles for last gnome-shell version available."
    GS_VERSION="48-0"
fi

usage() {
    cat <<EOF
Usage: $0 [OPTION]...

OPTIONS:
  -d, --dest DIR          Specify destination directory (Default: $DEST_DIR)

  -n, --name NAME         Specify theme name (Default: $THEME_NAME)

  -t, --theme VARIANT     Specify theme color variant(s) [default|green|grey|orange|pink|purple|red|teal|yellow|all] (Default: blue)

  -c, --color VARIANT     Specify color variant(s) [light|dark] (Default: All variants))

  -s, --size VARIANT      Specify size variant [standard|compact] (Default: standard variant)

  -l, --libadwaita        Link installed gtk-4.0 theme to config folder for all libadwaita app use this theme

  -ul, --unlink-libadwaita
                          Unlink (remove) the gtk-4.0 config folder links for libadwaita 

  -r, --remove,
  -u, --uninstall         Uninstall/Remove installed themes or links

  --tweaks                Specify versions for tweaks
                          1. [medium|soft]	Medium|Soft| ColorSchemes version
                          2. black      	Blackness color version
						  3. outline    	Windows with 2px outline style
                          4. float      	Floating gnome-shell panel style
                          5. macos:			Macos style windows button

  -h, --help              Show help
EOF
}

install() {
    local dest="${1}"
    local name="${2}"
    local theme="${3}"
    local color="${4}"
    local size="${5}"
    local ctype="${6}"
    local window="${7}"

    [[ "${color}" == '-Light' ]] && local ELSE_LIGHT="${color}"
    [[ "${color}" == '-Dark' ]] && local ELSE_DARK="${color}"

    local THEME_DIR="${1}/${2}${3}${4}${5}${6}"

    [[ -d "${THEME_DIR}" ]] && rm -rf "${THEME_DIR}"

    echo "Installing '${THEME_DIR}'..."

    theme_tweaks

    mkdir -p "${THEME_DIR}"

    # Index Theme File
    echo "Type=X-GNOME-Metatheme" >>"${THEME_DIR}/index.theme"
    echo "[Desktop Entry]" >>"${THEME_DIR}/index.theme"
    echo "Name=${2}${3}${4}${5}${6}" >>"${THEME_DIR}/index.theme"
    echo "Comment=An Flat Gtk+ theme based on Elegant Design" >>"${THEME_DIR}/index.theme"
    echo "Encoding=UTF-8" >>"${THEME_DIR}/index.theme"
    echo "" >>"${THEME_DIR}/index.theme"
    echo "[X-GNOME-Metatheme]" >>"${THEME_DIR}/index.theme"
    echo "GtkTheme=${2}${3}${4}${5}${6}" >>"${THEME_DIR}/index.theme"
    echo "MetacityTheme=${2}${3}${4}${5}${6}" >>"${THEME_DIR}/index.theme"
    echo "IconTheme=Tela-circle${ELSE_DARK:-}" >>"${THEME_DIR}/index.theme"
    echo "CursorTheme=${2}-cursors" >>"${THEME_DIR}/index.theme"
    echo "ButtonLayout=close,minimize,maximize:menu" >>"${THEME_DIR}/index.theme"

    # Gnome Shell Themes
    mkdir -p "${THEME_DIR}/gnome-shell"
    cp -r "${SRC_DIR}/main/gnome-shell/pad-osd.css" "${THEME_DIR}/gnome-shell"
    sassc $SASSC_OPT "${SRC_DIR}/main/gnome-shell/gnome-shell${color}.scss" "${THEME_DIR}/gnome-shell/gnome-shell.css"

    cp -r "${SRC_DIR}/assets/gnome-shell/common-assets" "${THEME_DIR}/gnome-shell/assets"
    cp -r "${SRC_DIR}/assets/gnome-shell/assets${ELSE_DARK:-}/"*.svg "${THEME_DIR}/gnome-shell/assets"
    cp -r "${SRC_DIR}/assets/gnome-shell/theme${theme}${ctype}/"*.svg "${THEME_DIR}/gnome-shell/assets"

    cd "${THEME_DIR}/gnome-shell"
    ln -s assets/no-events.svg no-events.svg
    ln -s assets/process-working.svg process-working.svg
    ln -s assets/no-notifications.svg no-notifications.svg

    # GTK2 Themes
    mkdir -p "${THEME_DIR}/gtk-2.0"
    # cp -r "${SRC_DIR}/main/gtk-2.0/gtkrc${theme}${ELSE_DARK:-}${ctype}" 				 "${THEME_DIR}/gtk-2.0/gtkrc"
    cp -r "${SRC_DIR}/main/gtk-2.0/common/"*'.rc' "${THEME_DIR}/gtk-2.0"
    cp -r "${SRC_DIR}/assets/gtk-2.0/assets-common${ELSE_DARK:-}" "${THEME_DIR}/gtk-2.0/assets"
    cp -r "${SRC_DIR}/assets/gtk-2.0/assets${theme}${ELSE_DARK:-}${ctype}/"*"png" "${THEME_DIR}/gtk-2.0/assets"

    # GTK3 Themes
    mkdir -p "${THEME_DIR}/gtk-3.0"
    cp -r "${SRC_DIR}/assets/gtk/assets${theme}${ctype}" "${THEME_DIR}/gtk-3.0/assets"
    cp -r "${SRC_DIR}/assets/gtk/scalable" "${THEME_DIR}/gtk-3.0/assets"
    cp -r "${SRC_DIR}/assets/gtk/thumbnails/thumbnail${theme}${ctype}${ELSE_DARK:-}.png" "${THEME_DIR}/gtk-3.0/thumbnail.png"
    sassc $SASSC_OPT "${SRC_DIR}/main/gtk-3.0/gtk${color}.scss" "${THEME_DIR}/gtk-3.0/gtk.css"
    sassc $SASSC_OPT "${SRC_DIR}/main/gtk-3.0/gtk-Dark.scss" "${THEME_DIR}/gtk-3.0/gtk-dark.css"

    # GTK4 Themes
    mkdir -p "${THEME_DIR}/gtk-4.0"
    cp -r "${SRC_DIR}/assets/gtk/scalable" "${THEME_DIR}/gtk-4.0/assets"
    cp -r "${SRC_DIR}/assets/gtk/thumbnails/thumbnail${theme}${ctype}${ELSE_DARK:-}.png" "${THEME_DIR}/gtk-4.0/thumbnail.png"
    sassc $SASSC_OPT "${SRC_DIR}/main/gtk-4.0/gtk${color}.scss" "${THEME_DIR}/gtk-4.0/gtk.css"
    sassc $SASSC_OPT "${SRC_DIR}/main/gtk-4.0/gtk-Dark.scss" "${THEME_DIR}/gtk-4.0/gtk-dark.css"

    # Cinnamon Themes
    mkdir -p "${THEME_DIR}/cinnamon"
    cp -r "${SRC_DIR}/assets/cinnamon/common-assets" "${THEME_DIR}/cinnamon/assets"
    cp -r "${SRC_DIR}/assets/cinnamon/assets${ELSE_DARK:-}/"*'.svg' "${THEME_DIR}/cinnamon/assets"
    cp -r "${SRC_DIR}/assets/cinnamon/theme${theme}${ctype}/"*'.svg' "${THEME_DIR}/cinnamon/assets"
    sassc $SASSC_OPT "${SRC_DIR}/main/cinnamon/cinnamon${color}.scss" "${THEME_DIR}/cinnamon/cinnamon.css"
    cp -r "${SRC_DIR}/assets/cinnamon/thumbnails/thumbnail${theme}${ctype}${color}.png" "${THEME_DIR}/cinnamon/thumbnail.png"

    # Metacity Themes
    mkdir -p "${THEME_DIR}/metacity-1"
    cp -r "${SRC_DIR}/main/metacity-1/metacity-theme-3${window}${color}.xml" "${THEME_DIR}/metacity-1/metacity-theme-3.xml"
    cp -r "${SRC_DIR}/assets/metacity-1/assets${window}" "${THEME_DIR}/metacity-1/assets"
    cp -r "${SRC_DIR}/assets/metacity-1/thumbnail${ELSE_DARK:-}.png" "${THEME_DIR}/metacity-1/thumbnail.png"
    cd "${THEME_DIR}/metacity-1" && ln -s metacity-theme-3.xml metacity-theme-1.xml && ln -s metacity-theme-3.xml metacity-theme-2.xml

    # XFWM4 Themes
    mkdir -p "${THEME_DIR}/xfwm4"
    cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${ctype}${window}/"*.png "${THEME_DIR}/xfwm4"
    cp -r "${SRC_DIR}/main/xfwm4/themerc${ELSE_LIGHT:-}" "${THEME_DIR}/xfwm4/themerc"
    mkdir -p "${THEME_DIR}-hdpi/xfwm4"
    cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${ctype}${window}-hdpi/"*.png "${THEME_DIR}-hdpi/xfwm4"
    cp -r "${SRC_DIR}/main/xfwm4/themerc${ELSE_LIGHT:-}" "${THEME_DIR}-hdpi/xfwm4/themerc"
    sed -i "s/button_offset=6/button_offset=9/" "${THEME_DIR}-hdpi/xfwm4/themerc"
    mkdir -p "${THEME_DIR}-xhdpi/xfwm4"
    cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${ctype}${window}-xhdpi/"*.png "${THEME_DIR}-xhdpi/xfwm4"
    cp -r "${SRC_DIR}/main/xfwm4/themerc${ELSE_LIGHT:-}" "${THEME_DIR}-xhdpi/xfwm4/themerc"
    sed -i "s/button_offset=6/button_offset=12/" "${THEME_DIR}-xhdpi/xfwm4/themerc"

    # Plank Themes
    mkdir -p "${THEME_DIR}/plank"
    if [[ "$color" == '-Light' ]]; then
        cp -r "${SRC_DIR}/main/plank/theme-Light${ctype}/"* "${THEME_DIR}/plank"
    else
        cp -r "${SRC_DIR}/main/plank/theme-Dark${ctype}/"* "${THEME_DIR}/plank"
    fi
}

themes=()
colors=()
sizes=()
lcolors=()

while [[ $# -gt 0 ]]; do
    case "${1}" in
        -d | --dest)
            dest="${2}"
            if [[ ! -d "${dest}" ]]; then
                echo "Destination directory does not exist. Let's make a new one..."
                mkdir -p ${dest}
            fi
            shift 2
            ;;
        -n | --name)
            name="${2}"
            shift 2
            ;;
        -r | --remove | -u | --uninstall)
            uninstall="true"
            shift
            ;;
        -l | --libadwaita)
            libadwaita="true"
            shift
            ;;
        -ul | --unlink-libadwaita)
            unlink_libadwaita="true"
            shift
            ;;
        -c | --color)
            shift
            for color in "${@}"; do
                case "${color}" in
                    light)
                        colors+=("${COLOR_VARIANTS[0]}")
                        lcolors+=("${COLOR_VARIANTS[0]}")
                        shift
                        ;;
                    dark)
                        colors+=("${COLOR_VARIANTS[1]}")
                        lcolors+=("${COLOR_VARIANTS[1]}")
                        shift
                        ;;
                    -* | --*)
                        break
                        ;;
                    *)
                        echo "ERROR: Unrecognized color variant '$1'."
                        echo "Try '$0 --help' for more information."
                        exit 1
                        ;;
                esac
            done
            ;;
        -t | --theme)
            accent='true'
            shift
            for variant in "$@"; do
                case "$variant" in
                    default)
                        themes+=("${THEME_VARIANTS[0]}")
                        shift
                        ;;
                    green)
                        themes+=("${THEME_VARIANTS[1]}")
                        shift
                        ;;
                    grey)
                        themes+=("${THEME_VARIANTS[2]}")
                        shift
                        ;;
                    orange)
                        themes+=("${THEME_VARIANTS[3]}")
                        shift
                        ;;
                    pink)
                        themes+=("${THEME_VARIANTS[4]}")
                        shift
                        ;;
                    pruple)
                        themes+=("${THEME_VARIANTS[5]}")
                        shift
                        ;;
                    red)
                        themes+=("${THEME_VARIANTS[6]}")
                        shift
                        ;;
                    teal)
                        themes+=("${THEME_VARIANTS[7]}")
                        shift
                        ;;
                    yellow)
                        themes+=("${THEME_VARIANTS[8]}")
                        shift
                        ;;
                    all)
                        themes+=("${THEME_VARIANTS[@]}")
                        shift
                        ;;
                    -*)
                        break
                        ;;
                    *)
                        echo "ERROR: Unrecognized theme variant '$1'."
                        echo "Try '$0 --help' for more information."
                        exit 1
                        ;;
                esac
            done
            ;;
        -s | --size)
            shift
            for variant in "$@"; do
                case "$variant" in
                    standard)
                        sizes+=("${SIZE_VARIANTS[0]}")
                        shift
                        ;;
                    compact)
                        sizes+=("${SIZE_VARIANTS[1]}")
                        compact='true'
                        shift
                        ;;
                    -*)
                        break
                        ;;
                    *)
                        echo "ERROR: Unrecognized size variant '${1:-}'."
                        echo "Try '$0 --help' for more information."
                        exit 1
                        ;;
                esac
            done
            ;;
        --tweaks)
            shift
            for variant in $@; do
                case "$variant" in
                    soft)
                        soft="true"
                        ctype="-Soft"
                        echo -e "Soft ColorScheme version! ..."
                        shift
                        ;;
                    medium)
                        medium="true"
                        ctype="-Medium"
                        echo -e "Medium ColorScheme version! ..."
                        shift
                        ;;
                    black)
                        blackness="true"
                        echo -e "Blackness version! ..."
                        shift
                        ;;
                    float)
                        float="true"
                        echo -e "Install Floating Gnome-Shell Panel version! ..."
                        shift
                        ;;
                    outline)
                        outline="true"
                        echo -e "Install 2px windows outline version! ..."
                        shift
                        ;;
                    macos)
                        macos="true"
                        window="-Macos"
                        echo -e "Macos window button version! ..."
                        shift
                        ;;
                    -*)
                        break
                        ;;
                    *)
                        echo "ERROR: Unrecognized tweaks variant '$1'."
                        echo "Try '$0 --help' for more information."
                        exit 1
                        ;;
                esac
            done
            ;;
        -h | --help)
            usage
            exit 0
            ;;
        *)
            echo "ERROR: Unrecognized installation option '$1'."
            echo "Try '$0 --help' for more information."
            exit 1
            ;;
    esac
done

if [[ "${#themes[@]}" -eq 0 ]]; then
    themes=("${THEME_VARIANTS[0]}")
fi

if [[ "${#colors[@]}" -eq 0 ]]; then
    colors=("${COLOR_VARIANTS[@]}")
fi

if [[ "${#lcolors[@]}" -eq 0 ]]; then
    lcolors=("${COLOR_VARIANTS[1]}")
fi

if [[ "${#sizes[@]}" -eq 0 ]]; then
    sizes=("${SIZE_VARIANTS[0]}")
fi

#  Check command avalibility
function has_command() {
    command -v $1 >/dev/null
}

#  Install needed packages
install_package() {
    if ! has_command sassc; then
        echo sassc needs to be installed to generate the css.
        if has_command zypper; then
            sudo zypper in sassc
        elif has_command apt-get; then
            sudo apt-get install sassc
        elif has_command dnf; then
            sudo dnf install sassc
        elif has_command dnf; then
            sudo dnf install sassc
        elif has_command pacman; then
            sudo pacman -S --noconfirm sassc
        fi
    fi
}

tweaks_temp() {
    cp -rf "${SRC_DIR}/sass/_tweaks.scss" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

compact_size() {
    sed -i "/\$compact:/s/false/true/" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

soft_color() {
    sed -i "/\@import/s/color-palette-default/color-palette-soft/" "${SRC_DIR}/sass/_tweaks-temp.scss"
    sed -i "/\$colorscheme:/s/default/soft/" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

medium_color() {
    sed -i "/\@import/s/color-palette-default/color-palette-medium/" "${SRC_DIR}/sass/_tweaks-temp.scss"
    sed -i "/\$colorscheme:/s/default/medium/" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

blackness_color() {
    sed -i "/\$blackness:/s/false/true/" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

float_panel() {
    sed -i "/\$float:/s/false/true/" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

outline_style() {
    sed -i "/\$outline:/s/false/true/" "${SRC_DIR}/sass/_tweaks-temp.scss"
}

macos_winbutton() {
    sed -i "/\$window_button:/s/normal/mac/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

gnome_shell_version() {
    cp -rf "${SRC_DIR}/sass/gnome-shell/_common.scss" "${SRC_DIR}/sass/gnome-shell/_common-temp.scss"

    sed -i "/\widgets/s/40-0/${GS_VERSION}/" "${SRC_DIR}/sass/gnome-shell/_common-temp.scss"

    if [[ "${GS_VERSION}" == '3-28' ]]; then
        sed -i "/\extensions/s/40-0/${GS_VERSION}/" "${SRC_DIR}/sass/gnome-shell/_common-temp.scss"
    fi
}

theme_color() {
    if [[ "$theme" != '' ]]; then
        case "$theme" in
            -Green)
                theme_color='green'
                ;;
            -Grey)
                theme_color='grey'
                ;;
            -Orange)
                theme_color='orange'
                ;;
            -Pink)
                theme_color='pink'
                ;;
            -Purple)
                theme_color='purple'
                ;;
            -Red)
                theme_color='red'
                ;;
            -Teal)
                theme_color='teal'
                ;;
            -Yellow)
                theme_color='yellow'
                ;;
        esac
        tweaks_temp
        sed -i "/\$theme:/s/default/${theme_color}/" "${SRC_DIR}/sass/_tweaks-temp.scss"
    fi
}

theme_tweaks() {
    if [[ "$accent" = "true" ]]; then
        theme_color
    fi

    if [[ "$compact" = "true" ]]; then
        compact_size
    fi

    if [[ "$soft" = "true" ]]; then
        soft_color
    fi

    if [[ "$medium" = "true" ]]; then
        medium_color
    fi

    if [[ "$blackness" = "true" ]]; then
        blackness_color
    fi

    if [[ "$float" = "true" ]]; then
        float_panel
    fi

    if [[ "$outline" = "true" ]]; then
        outline_style
    fi

    if [[ "$macos" = "true" ]]; then
        macos_winbutton
    fi
}

uninstall_link() {
    rm -rf "${HOME}/.config/gtk-4.0/"{assets,windows-assets,gtk.css,gtk-dark.css}
}

link_libadwaita() {
    local dest="${1}"
    local name="${2}"
    local theme="${3}"
    local color="${4}"
    local size="${5}"
    local ctype="${6}"

    local THEME_DIR="${1}/${2}${3}${4}${5}${6}"

    rm -rf "${HOME}/.config/gtk-4.0/"{assets,gtk.css,gtk-dark.css}

    echo -e "\nLink '$THEME_DIR/gtk-4.0' to '${HOME}/.config/gtk-4.0' for libadwaita..."

    mkdir -p "${HOME}/.config/gtk-4.0"
    ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
    ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
    ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
}

link_theme() {
    for theme in "${themes[@]}"; do
        for color in "${lcolors[@]}"; do
            for size in "${sizes[@]}"; do
                link_libadwaita "${dest:-$DEST_DIR}" "${name:-$THEME_NAME}" "$theme" "$color" "$size" "$ctype"
            done
        done
    done
}

install_theme() {
    for theme in "${themes[@]}"; do
        for color in "${colors[@]}"; do
            for size in "${sizes[@]}"; do
                install "${dest:-$DEST_DIR}" "${name:-$THEME_NAME}" "$theme" "$color" "$size" "$ctype" "$window"
                make_gtkrc "${dest:-$DEST_DIR}" "${name:-$THEME_NAME}" "$theme" "$color" "$size" "$ctype" "$window"
            done
        done
    done

    if has_command xfce4-popup-whiskermen; then
        sed -i "s|.*menu-opacity=.*|menu-opacity=0|" "$HOME/.config/xfce4/panel/whiskermenu"*".rc"
    fi

    if (pgrep xfce4-session &>/dev/null); then
        xfce4-panel -r
    fi
}

uninstall() {
    local dest="${1}"
    local name="${2}"
    local theme="${3}"
    local color="${4}"
    local size="${5}"
    local ctype="${6}"

    local THEME_DIR="${1}/${2}${3}${4}${5}${6}"

    if [[ -d "${THEME_DIR}" ]]; then
        echo -e "Uninstall ${THEME_DIR}... "
        rm -rf "${THEME_DIR}"
    fi
}

uninstall_theme() {
    for theme in "${themes[@]}"; do
        for color in "${colors[@]}"; do
            for size in "${sizes[@]}"; do
                uninstall "${dest:-$DEST_DIR}" "${name:-$THEME_NAME}" "$theme" "$color" "$size" "$ctype"
            done
        done
    done
}

if [[ "$uninstall" == 'true' ]]; then
    if [[ "$libadwaita" == 'true' ]]; then
        echo -e "\nUninstall ${HOME}/.config/gtk-4.0 links ..."
        uninstall_link
    else
        echo && uninstall_theme && uninstall_link
    fi
elif [[ "$unlink_libadwaita" == 'true' ]]; then
    echo -e "\nUnlinking libadwaita (removing ${HOME}/.config/gtk-4.0 links)..."
    uninstall_link
    echo -e "Done. Libadwaita apps will now use the default theme."
else
    install_package && tweaks_temp && gnome_shell_version && install_theme
    if [[ "$libadwaita" == 'true' ]]; then
        uninstall_link && link_theme
    fi
fi

echo
echo Done.
