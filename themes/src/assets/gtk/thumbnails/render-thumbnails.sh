#! /usr/bin/env bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

./make-thumbnails.sh

for theme in '' '-Purple' '-Pink' '-Red' '-Orange' '-Yellow' '-Green' '-Blue' '-Grey'; do
    for type in '' '-Soft' '-Medium'; do
        SRC_FILE="thumbnail${theme}${type}.svg"
        for color in '' '-Dark'; do
            echo
            echo Rendering thumbnail${theme}${type}${color}.png
            $INKSCAPE --export-id=thumbnail${theme}${type}${color} \
                --export-id-only \
                --export-dpi=96 \
                --export-filename=thumbnail${theme}${type}${color}.png $SRC_FILE >/dev/null &&
            $OPTIPNG -o7 --quiet thumbnail${theme}${type}.png
        done
    done
done

for theme in '' '-Purple' '-Pink' '-Red' '-Orange' '-Yellow' '-Green' '-Blue' '-Grey'; do
    for type in '' '-Soft' '-Medium'; do
        if [[ ${theme} == '' && ${type} == '' ]]; then
            echo "keep thumbnail.svg"
        else
            rm -rf "thumbnail${theme}${type}.svg"
        fi
    done
done

exit 0
