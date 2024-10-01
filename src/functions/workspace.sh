#!/bin/bash
workspace_app() {
    local WORKSPACE_APP="${args[application]}"
    echo "$WORKSPACE_APP"
}

workspace_yes() {
    if [ -z "${args[--yes]}" ]; then
        return
    else 
        echo "--yes"
    fi
}

workspace_setup_flag() {
    echo "${args[--setup]}"
}

workspace_install_flag() {
    echo "${args[--install]}"

}

workspace_config_flag() {
    echo "${args[--config]}"
}

workspace_distro() {
    local WORKSPACE_DISTRO="${args[distro]}"
    echo "$WORKSPACE_DISTRO"
}
