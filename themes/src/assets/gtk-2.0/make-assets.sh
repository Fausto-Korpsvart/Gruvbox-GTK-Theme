#! /usr/bin/env bash

for theme in '' '-Purple' '-Pink' '-Red' '-Orange' '-Yellow' '-Green' '-Blue' '-Grey'; do
    for color in '' '-Dark'; do
        for type in '' '-Soft' '-Medium'; do
            if [[ "$color" == '' ]]; then
                case "$theme" in
                    '')
                        theme_color='#27a1b9'
                        ;;
                    -Purple)
                        theme_color='#9d7cd8'
                        ;;
                    -Pink)
                        theme_color='#ff007c'
                        ;;
                    -Red)
                        theme_color='#f7768e'
                        ;;
                    -Orange)
                        theme_color='#ff9e64'
                        ;;
                    -Yellow)
                        theme_color='#e0af68'
                        ;;
                    -Green)
                        theme_color='#9ece6a'
                        ;;
                    -Blue)
                        theme_color='#7aa2f7'
                        ;;
                    -Grey)
                        theme_color='#1a1b26'
                        ;;
                esac

                if [[ "$type" == '-Soft' ]]; then
                    background_color='#c0caf5'

                    case "$theme" in
                        '')
                            theme_color='#29a4bd'
                            ;;
                        -Purple)
                            theme_color='#9d7cd8'
                            ;;
                        -Pink)
                            theme_color='#ff007c'
                            ;;
                        -Red)
                            theme_color='#f7768e'
                            ;;
                        -Orange)
                            theme_color='#ff9e64'
                            ;;
                        -Yellow)
                            theme_color='#e0af68'
                            ;;
                        -Green)
                            theme_color='#9ece6a'
                            ;;
                        -Blue)
                            theme_color='#7aa2f7'
                            ;;
                        -Grey)
                            theme_color='#24283b'
                            ;;
                    esac
                fi

                if [[ "$type" == '-Medium' ]]; then
                    background_color='#c8d3f5'

                    case "$theme" in
                        '')
                            theme_color='#589ed7'
                            ;;
                        -Purple)
                            theme_color='#c099ff'
                            ;;
                        -Pink)
                            theme_color='#fca7ea'
                            ;;
                        -Red)
                            theme_color='#ff757f'
                            ;;
                        -Orange)
                            theme_color='#ff966c'
                            ;;
                        -Yellow)
                            theme_color='#ffc777'
                            ;;
                        -Green)
                            theme_color='#c3e88d'
                            ;;
                        -Blue)
                            theme_color='#3e68d7'
                            ;;
                        -Grey)
                            theme_color='#222436'
                            ;;
                    esac
                fi
            else
                case "$theme" in
                    '')
                        theme_color='#006a83'
                        ;;
                    -Purple)
                        theme_color='#7847bd'
                        ;;
                    -Pink)
                        theme_color='#d20065'
                        ;;
                    -Red)
                        theme_color='#f52a65'
                        ;;
                    -Orange)
                        theme_color='#b15c00'
                        ;;
                    -Yellow)
                        theme_color='#8c6c3e'
                        ;;
                    -Green)
                        theme_color='#587539'
                        ;;
                    -Blue)
                        theme_color='#7aa2f7'
                        ;;
                    -Grey)
                        theme_color='#c0caf5'
                        ;;
                esac

                if [[ "$type" == '-Soft' ]]; then
                    background_color='#24283b'

                    case "$theme" in
                        '')
                            theme_color='#006a83'
                            ;;
                        -Purple)
                            theme_color='#7847bd'
                            ;;
                        -Pink)
                            theme_color='#d20065'
                            ;;
                        -Red)
                            theme_color='#f52a65'
                            ;;
                        -Orange)
                            theme_color='#b15c00'
                            ;;
                        -Yellow)
                            theme_color='#8c6c3e'
                            ;;
                        -Green)
                            theme_color='#587539'
                            ;;
                        -Blue)
                            theme_color='#2e7de9'
                            ;;
                        -Grey)
                            theme_color='#c0caf5'
                            ;;
                    esac
                fi

                if [[ "$type" == '-Medium' ]]; then
                    background_color='#222436'

                    case "$theme" in
                        '')
                            theme_color='#006a83'
                            ;;
                        -Purple)
                            theme_color='#7847bd'
                            ;;
                        -Pink)
                            theme_color='#d20065'
                            ;;
                        -Red)
                            theme_color='#f52a65'
                            ;;
                        -Orange)
                            theme_color='#b15c00'
                            ;;
                        -Yellow)
                            theme_color='#8c6c3e'
                            ;;
                        -Green)
                            theme_color='#587539'
                            ;;
                        -Blue)
                            theme_color='#2e7de9'
                            ;;
                        -Grey)
                            theme_color='#c8d3f5'
                            ;;
                    esac
                fi
            fi

            if [[ "$type" != '' ]]; then
                cp -r "assets${color}.svg" "assets${theme}${color}${type}.svg"
                if [[ "$color" == '' ]]; then
                    sed -i "s/#27a1b9/${theme_color}/g" "assets${theme}${color}${type}.svg"
                else
                    sed -i "s/#006a83/${theme_color}/g" "assets${theme}${color}${type}.svg"
                fi
            elif [[ "$theme" != '' ]]; then
                cp -r "assets${color}.svg" "assets${theme}${color}.svg"
                if [[ "$color" == '' ]]; then
                    sed -i "s/#27a1b9/${theme_color}/g" "assets${theme}${color}.svg"
                else
                    sed -i "s/#006a83/${theme_color}/g" "assets${theme}${color}.svg"
                fi
            fi

        done
    done
done

echo -e "DONE!"
