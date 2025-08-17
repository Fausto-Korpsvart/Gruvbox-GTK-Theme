#! /usr/bin/env bash

for theme in '' '-Blue' '-Green' '-Grey' '-Orange' '-Pink' '-Purple' '-Red' '-Teal' '-Yellow'; do
    for color in '' '-Dark'; do
        for type in '' '-Medium' '-Soft'; do
            if [[ "$color" == '' ]]; then
                case "$theme" in
                    '')
                        theme_color='#45707a'
                        ;;
                    -Blue)
                        theme_color='#45707a'
                        ;;
                    -Green)
                        theme_color='#6c782e'
                        ;;
                    -Grey)
                        theme_color='#504945'
                        ;;
                    -Orange)
                        theme_color='#c35e0a'
                        ;;
                    -Pink)
                        theme_color='#b16286'
                        ;;
                    -Purple)
                        theme_color='#ab62b1'
                        ;;
                    -Red)
                        theme_color='#c14a4a'
                        ;;
                    -Teal)
                        theme_color='#4c7a5d'
                        ;;
                    -Yellow)
                        theme_color='#b47109'
                        ;;
                esac

                if [[ "$type" == '-Medium' ]]; then
                    background_color='#fbf1c7'

                    case "$theme" in
                        '')
                            theme_color='#45707a'
                            ;;
                        -Blue)
                            theme_color='#45707a'
                            ;;
                        -Green)
                            theme_color='#6c782e'
                            ;;
                        -Grey)
                            theme_color='#504945'
                            ;;
                        -Orange)
                            theme_color='#c35e0a'
                            ;;
                        -Pink)
                            theme_color='#b16286'
                            ;;
                        -Purple)
                            theme_color='#ab62b1'
                            ;;
                        -Red)
                            theme_color='#c14a4a'
                            ;;
                        -Teal)
                            theme_color='#4c7a5d'
                            ;;
                        -Yellow)
                            theme_color='#b47109'
                            ;;
                    esac
                fi

                if [[ "$type" == '-Soft' ]]; then
                    background_color='#fbf1c7'

                    case "$theme" in
                        '')
                            theme_color='#45707a'
                            ;;
                        -Blue)
                            theme_color='#45707a'
                            ;;
                        -Green)
                            theme_color='#6c782e'
                            ;;
                        -Grey)
                            theme_color='#504945'
                            ;;
                        -Orange)
                            theme_color='#c35e0a'
                            ;;
                        -Pink)
                            theme_color='#b16286'
                            ;;
                        -Purple)
                            theme_color='#ab62b1'
                            ;;
                        -Red)
                            theme_color='#c14a4a'
                            ;;
                        -Teal)
                            theme_color='#4c7a5d'
                            ;;
                        -Yellow)
                            theme_color='#b47109'
                            ;;
                    esac
                fi
            else
                case "$theme" in
                    '')
                        theme_color='#7daea3'
                        ;;
                    -Blue)
                        theme_color='#7daea3'
                        ;;
                    -Green)
                        theme_color='#a9b665'
                        ;;
                    -Grey)
                        theme_color='#ebdbb2'
                        ;;
                    -Orange)
                        theme_color='#e78a4e'
                        ;;
                    -Pink)
                        theme_color='#d3869b'
                        ;;
                    -Purple)
                        theme_color='#d386cd'
                        ;;
                    -Red)
                        theme_color='#ea6962'
                        ;;
                    -Teal)
                        theme_color='#89b482'
                        ;;
                    -Yellow)
                        theme_color='#d8a657'
                        ;;
                esac

                if [[ "$type" == '-Medium' ]]; then
                    background_color='#282828'

                    case "$theme" in
                        '')
                            theme_color='#7daea3'
                            ;;
                        -Blue)
                            theme_color='#7daea3'
                            ;;
                        -Green)
                            theme_color='#a9b665'
                            ;;
                        -Grey)
                            theme_color='#ebdbb2'
                            ;;
                        -Orange)
                            theme_color='#e78a4e'
                            ;;
                        -Pink)
                            theme_color='#d3869b'
                            ;;
                        -Purple)
                            theme_color='#d386cd'
                            ;;
                        -Red)
                            theme_color='#ea6962'
                            ;;
                        -Teal)
                            theme_color='#89b482'
                            ;;
                        -Yellow)
                            theme_color='#d8a657'
                            ;;
                    esac
                fi

                if [[ "$type" == '-Soft' ]]; then
                    background_color='#32302f'

                    case "$theme" in
                        '')
                            theme_color='#7daea3'
                            ;;
                        -Blue)
                            theme_color='#7daea3'
                            ;;
                        -Green)
                            theme_color='#a9b665'
                            ;;
                        -Grey)
                            theme_color='#ebdbb2'
                            ;;
                        -Orange)
                            theme_color='#e78a4e'
                            ;;
                        -Pink)
                            theme_color='#d3869b'
                            ;;
                        -Purple)
                            theme_color='#d386cd'
                            ;;
                        -Red)
                            theme_color='#ea6962'
                            ;;
                        -Teal)
                            theme_color='#89b482'
                            ;;
                        -Yellow)
                            theme_color='#d8a657'
                            ;;
                    esac
                fi
            fi

            if [[ "$type" != '' ]]; then
                cp -r "assets${color}.svg" "assets${theme}${color}${type}.svg"
                if [[ "$color" == '' ]]; then
                    sed -i "s/#7daea3/${theme_color}/g" "assets${theme}${color}${type}.svg"
                else
                    sed -i "s/#45707a/${theme_color}/g" "assets${theme}${color}${type}.svg"
                fi
            elif [[ "$theme" != '' ]]; then
                cp -r "assets${color}.svg" "assets${theme}${color}.svg"
                if [[ "$color" == '' ]]; then
                    sed -i "s/#7daea3/${theme_color}/g" "assets${theme}${color}.svg"
                else
                    sed -i "s/#45707a/${theme_color}/g" "assets${theme}${color}.svg"
                fi
            fi

        done
    done
done

echo -e "DONE!"
