#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Gruvbox

_THEME_VARIANTS=('' '-Green' '-Grey' '-Orange' '-Pink' '-Purple' '-Red' '-Teal' '-Yellow')
_SCHEME_VARIANTS=('' '-Medium' '-Soft')
_COLOR_VARIANTS=('-Light' '-Dark')
_SIZE_VARIANTS=('' '-Compact')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
    IFS=', ' read -r -a _COLOR_VARIANTS <<<"${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SCHEME_VARIANTS:-}" ]; then
    IFS=', ' read -r -a _SCHEME_VARIANTS <<<"${SCHEME_VARIANTS:-}"
fi

if [ ! -z "${THEME_VARIANTS:-}" ]; then
    IFS=', ' read -r -a _THEME_VARIANTS <<<"${THEME_VARIANTS:-}"
fi

if [ ! -z "${SIZE_VARIANTS:-}" ]; then
    IFS=', ' read -r -a _SIZE_VARIANTS <<<"${SIZE_VARIANTS:-}"
fi

Tar_themes() {
    for scheme in "${_SCHEME_VARIANTS[@]}"; do
        rm -rf ${THEME_NAME}${scheme}.tar
        rm -rf ${THEME_NAME}${scheme}.tar.xz
    done

    for scheme in "${_SCHEME_VARIANTS[@]}"; do
        tar -Jcvf ${THEME_NAME}${theme}${scheme}.tar.xz ${THEME_NAME}{'','-Green','-Grey','-Orange','-Pink','-Purple','-Red','-Teal','-Yellow'}{'-Light','-Dark'}${scheme}
    done
}

Clear_theme() {
    for theme in "${_THEME_VARIANTS[@]}"; do
        for color in "${_COLOR_VARIANTS[@]}"; do
            for scheme in "${_SCHEME_VARIANTS[@]}"; do
                rm -rf ${THEME_NAME}${theme}${color}${scheme}{'','-hdpi','-xhdpi'}
            done
        done
    done
}

cd .. && ./install.sh -d $THEME_DIR -t all && ./install.sh -d $THEME_DIR --tweaks medium -t all && ./install.sh -d $THEME_DIR --tweaks soft -t all
cd $THEME_DIR && Tar_themes && Clear_theme
