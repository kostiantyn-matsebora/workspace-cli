#!/bin/bash
upgrade_workspace() {
  AUTOMATIC_MODE=$(is_automatic_mode "$1")
  
  echo_info "Upgrading workspace $(workspace --version)"
  local WORKSPACE_HOME_PATH="$HOME/bin"
  local WORKSPACE_PATH="$WORKSPACE_HOME_PATH"
  if [[ $AUTOMATIC_MODE != "0" ]]
  then
    WORKSPACE_PATH="$(question "Enter the path where workspace is installed ($WORKSPACE_HOME_PATH as default): ")"
    if [ -z "$WORKSPACE_PATH" ]
    then
        WORKSPACE_PATH="$WORKSPACE_HOME_PATH"
    fi
  fi
  echo_message "Upgrading workspace at $WORKSPACE_PATH"
  wget https://raw.githubusercontent.com/kostiantyn-matsebora/workspace-cli/master/release/workspace -O "$WORKSPACE_PATH/workspace"
  chmod +x "$WORKSPACE_PATH/workspace"
  exit_if_error "Error upgrading workspace"
  echo_info "Workspace upgraded successfully to version $(workspace --version)"
}
