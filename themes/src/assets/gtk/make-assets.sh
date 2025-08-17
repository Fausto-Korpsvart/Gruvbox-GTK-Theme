#! /usr/bin/env bash

for theme in '' '-Blue' '-Green' '-Grey' '-Orange' '-Pink' '-Purple' '-Red' '-Teal' '-Yellow'; do
    for type in '' '-Medium' '-Soft'; do
        case "$theme" in
            '')
                theme_color_dark='#7daea3'
                theme_color_light='#45707a'
                ;;
            -Blue)
                theme_color_dark='#7daea3'
                theme_color_light='#45707a'
                ;;
            -Green)
                theme_color_dark='#a9b665'
                theme_color_light='#6c782e'
                ;;
            -Grey)
                theme_color_dark='#ebdbb2'
                theme_color_light='#504945'
                ;;
            -Orange)
                theme_color_dark='#e78a4e'
                theme_color_light='#c35e0a'
                ;;
            -Pink)
                theme_color_dark='#d3869b'
                theme_color_light='#b16286'
                ;;
            -Purple)
                theme_color_dark='#d386cd'
                theme_color_light='#ab62b1'
                ;;
            -Red)
                theme_color_dark='#ea6962'
                theme_color_light='#c14a4a'
                ;;
            -Teal)
                theme_color_dark='#89b482'
                theme_color_light='#4c7a5d'
                ;;
            -Yellow)
                theme_color_dark='#d8a657'
                theme_color_light='#b47109'
                ;;
        esac

        if [[ "$type" == '-Medium' ]]; then
            background_light='#fbf1c7'
            background_dark='#282828'
            base_dark='#1d2021'
            surface_dark='#3c3836'

            case "$theme" in
                '')
                    theme_color_dark='#7daea3'
                    theme_color_light='#45707a'
                    ;;
                -Blue)
                    theme_color_dark='#7daea3'
                    theme_color_light='#45707a'
                    ;;
                -Green)
                    theme_color_dark='#a9b665'
                    theme_color_light='#6c782e'
                    ;;
                -Grey)
                    theme_color_dark='#ebdbb2'
                    theme_color_light='#504945'
                    ;;
                -Orange)
                    theme_color_dark='#e78a4e'
                    theme_color_light='#c35e0a'
                    ;;
                -Pink)
                    theme_color_dark='#d3869b'
                    theme_color_light='#b16286'
                    ;;
                -Purple)
                    theme_color_dark='#d386cd'
                    theme_color_light='#ab62b1'
                    ;;
                -Red)
                    theme_color_dark='#ea6962'
                    theme_color_light='#c14a4a'
                    ;;
                -Teal)
                    theme_color_dark='#89b482'
                    theme_color_light='#4c7a5d'
                    ;;
                -Yellow)
                    theme_color_dark='#d8a657'
                    theme_color_light='#b47109'
                    ;;
            esac
        fi

        if [[ "$type" == '-Soft' ]]; then
            background_light='#fbf1c7'
            background_dark='#32302f'
            base_dark='#211f1e'
            surface_dark='#3c3836'

            case "$theme" in
                '')
                    theme_color_dark='#7daea3'
                    theme_color_light='#45707a'
                    ;;
                -Blue)
                    theme_color_dark='#7daea3'
                    theme_color_light='#45707a'
                    ;;
                -Green)
                    theme_color_dark='#a9b665'
                    theme_color_light='#6c782e'
                    ;;
                -Grey)
                    theme_color_dark='#ebdbb2'
                    theme_color_light='#504945'
                    ;;
                -Orange)
                    theme_color_dark='#e78a4e'
                    theme_color_light='#c35e0a'
                    ;;
                -Pink)
                    theme_color_dark='#d3869b'
                    theme_color_light='#b16286'
                    ;;
                -Purple)
                    theme_color_dark='#d386cd'
                    theme_color_light='#ab62b1'
                    ;;
                -Red)
                    theme_color_dark='#ea6962'
                    theme_color_light='#c14a4a'
                    ;;
                -Teal)
                    theme_color_dark='#89b482'
                    theme_color_light='#4c7a5d'
                    ;;
                -Yellow)
                    theme_color_dark='#d8a657'
                    theme_color_light='#b47109'
                    ;;
            esac
        fi

        if [[ "$type" != '' ]]; then
            cp -rf "assets.svg" "assets${theme}${type}.svg"
            sed -i "s/#7daea3/${theme_color_dark}/g" "assets${theme}${type}.svg"
            sed -i "s/#45707a/${theme_color_light}/g" "assets${theme}${type}.svg"
            sed -i "s/#fbf1c7/${background_light}/g" "assets${theme}${type}.svg"
            sed -i "s/#1d2021/${background_dark}/g" "assets${theme}${type}.svg"
            sed -i "s/#141617/${base_dark}/g" "assets${theme}${type}.svg"
            sed -i "s/#3c3836/${surface_dark}/g" "assets${theme}${type}.svg"
        elif [[ "$theme" != '' ]]; then
            cp -rf "assets.svg" "assets${theme}.svg"
            sed -i "s/#7daea3/${theme_color_dark}/g" "assets${theme}.svg"
            sed -i "s/#45707a/${theme_color_light}/g" "assets${theme}.svg"
        fi
    done
done

echo -e "DONE!"
