make_gtkrc() {
    local dest="${1}"
    local name="${2}"
    local theme="${3}"
    local color="${4}"
    local size="${5}"
    local ctype="${6}"
    local window="${7}"

    [[ "${color}" == '-Light' ]] && local ELSE_LIGHT="${color}"
    [[ "${color}" == '-Dark' ]] && local ELSE_DARK="${color}"

    local GTKRC_DIR="${SRC_DIR}/main/gtk-2.0"
    local THEME_DIR="${1}/${2}${3}${4}${5}${6}"

    if [[ "${color}" != '-Dark' ]]; then
        case "$theme" in
            '')
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

        if [[ "$ctype" == '-Medium' ]]; then
            case "$theme" in
                '')
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

        if [[ "$ctype" == '-Soft' ]]; then
            case "$theme" in
                '')
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

        if [[ "$ctype" == '-Medium' ]]; then
            case "$theme" in
                '')
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

        if [[ "$ctype" == '-Soft' ]]; then
            case "$theme" in
                '')
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

    if [[ "$blackness" == 'true' ]]; then
        case "$ctype" in
            '')
                background_light='#f9f5d7'
                background_dark='#0f0e0e'
                background_darker='#141617'
                background_alt='#211f1e'
                titlebar_light='#fbf1c7'
                titlebar_dark='#0d0907'
                ;;
            -Medium)
                background_light='#f9f5d7'
                background_dark='#0f0e0e'
                background_darker='#141617'
                background_alt='#211f1e'
                titlebar_light='#fbf1c7'
                titlebar_dark='#0d0907'
                ;;
            -Soft)
                background_light='#f9f5d7'
                background_dark='#0f0e0e'
                background_darker='#141617'
                background_alt='#211f1e'
                titlebar_light='#fbf1c7'
                titlebar_dark='#0d0907'
                ;;
        esac
    else
        case "$ctype" in
            '')
                background_light='#fbf1c7'
                background_dark='#1d2021'
                background_darker='#3c3836'
                background_alt='#504945'
                titlebar_light='#ebdbb2'
                titlebar_dark='#242220'
                ;;
            -Medium)
                background_light='#fbf1c7'
                background_dark='#282828'
                background_darker='#32302f'
                background_alt='#3c3836'
                titlebar_light='#ebdbb2'
                titlebar_dark='#1d2021'
                ;;
            -Soft)
                background_light='#fbf1c7'
                background_dark='#32302f'
                background_darker='#3c3836'
                background_alt='#504945'
                titlebar_light='#ebdbb2'
                titlebar_dark='#282524'
                ;;
        esac
    fi

    mkdir -p "${THEME_DIR}/gtk-2.0"

    cp -r "${GTKRC_DIR}/gtkrc${ELSE_DARK:-}-default" "${THEME_DIR}/gtk-2.0/gtkrc"
    sed -i "s/#fbf1c7/${background_light}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
    sed -i "s/#1d2021/${background_dark}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
    sed -i "s/#3c3836/${background_alt}/g" "${THEME_DIR}/gtk-2.0/gtkrc"

    if [[ "${color}" == '-Dark' ]]; then
        sed -i "s/#7daea3/${theme_color}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
        sed -i "s/#3c3836/${background_darker}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
        sed -i "s/#282524/${titlebar_dark}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
    else
        sed -i "s/#45707a/${theme_color}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
        sed -i "s/#ebdbb2/${titlebar_light}/g" "${THEME_DIR}/gtk-2.0/gtkrc"
    fi
}
