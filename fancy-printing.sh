#!/bin/bash
print_in_color () {
  local color=$1
  local text=$2
  local blue='\033[0;34m'
  local green='\033[0;32m'
  local red='\033[0;31m'
  local light_purple='\033[0;35m'
  local no_color='\033[0m'

  local applied_color
  case $color in
    b*)
      applied_color=$blue;;
    g*)
      applied_color=$green;;
    r*)
      applied_color=$red;;
    p* | l*)
      applied_color=$light_purple;;
  esac

  echo -e "${applied_color}${text}${no_color}"
}

print_n_times () {
  local n=$1
  local text=$2

  # There is a special edge case for echo in zsh and text parameter '-'.
  # Therefore, we ensure that echo is always run in bash.
  # See: https://stackoverflow.com/a/57656708
  bash -c "for ((i = 0; i < ${n}; i++)); do echo -en \"${text}\"; done"
}

print_banner () {
  local text=$1
  local text_length=${#text}
  local banner_character="-"
  local padding_left="$banner_character "
  local padding_right=" $banner_character"
  local padding_length=$((${#padding_left} + ${#padding_right}))
  local banner_length=$((text_length + padding_length))

  echo

  print_n_times "${banner_length}" "${banner_character}"

  echo

  local colored_text
  colored_text=$(print_in_color purple "${text}")

  echo -e "$padding_left${colored_text}$padding_right"

  print_n_times "${banner_length}" "${banner_character}"

  echo
}

print_indented () {
  local text=$1
  echo "|---> ${text}"
}

print_success () {
  local indented_text
  indented_text=$(print_indented "$1")
  echo -e "$(print_in_color green "${indented_text}")"
}

print_failure () {
  local indented_text
  indented_text=$(print_indented "$1")
  echo -e "$(print_in_color red "${indented_text}")"
}
