#!/bin/bash

register_autocomplete() {

echo_info 'Registering autocomplete'
# shellcheck disable=SC2016
echo  'eval "$(workspace completions)"' >> "$HOME/.bashrc"
echo_info 'Autocomplete registered successfully'
}
