#!/bin/bash

WORKSPACE_YES="$(workspace_yes)"

if [[ "$(workspace_setup_flag)" == 1 ]]; then
	setup_git_toolkit
else	
	if [[ "$(workspace_install_flag)"  == 1 ]]; then
		install_git_toolkit "$WORKSPACE_YES"
	fi
	 if [[ "$(workspace_config_flag)" == 1 ]]; then
		configure_git
	fi
fi
