#!/bin/bash
get_config_value_from_file() {
  local config_path=$1
  local key=$2

  if [ ! -f "$config_path" ]; then
    return 1
  fi

  local result
  result=$(grep -E "^\\s*$key\\s*=\\s*" "$config_path" | head | awk -F '=' '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  if [ -n "$result" ]; then
    printf "%s\\n" "$result"
    return 0
  fi

  return 2
}