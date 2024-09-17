#!/bin/bash
workspace_app() {
    local WORKSPACE_APP="${args[application]}"
    echo $WORKSPACE_APP
}

workspace_yes() {
    if [ -z "${args[--yes]}" ]; then
        return
    else 
        echo "--yes"
    fi
}


