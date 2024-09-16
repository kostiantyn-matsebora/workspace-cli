workspace_dir() {
    local WORKSPACE_DIR="${BASH_SOURCE%/*}"
    if [[ ! -d "$WORKSPACE_DIR" ]]; then $WORKSPACE_DIR="$PWD"; fi
    echo $WORKSPACE_DIR
}

workspace_app() {
    local WORKSPACE_APP="${args[application]}"
    echo $WORKSPACE_APP
}

workspace_yes() {
    local WORKSPACE_YES="${args[--yes]}"
    echo $WORKSPACE_YES
}

workspace_automatic() {
  local WORKSPACE_YES="$(workspace_yes)"

  if [[ $WORKSPACE_YES == "1" ]]; then
    local WORKSPACE_AUTOMATIC="-y"
  fi
  echo $WORKSPACE_AUTOMATIC
}

