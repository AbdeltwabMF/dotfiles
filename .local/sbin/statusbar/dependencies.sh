#!/bin/bash

declare -a packages
packages=(
  "sysstat"
  "acpi"
  "libnotify"
  "jq"
)

for ((i = 0; i < ${#packages[@]}; i++));
do
  yay -S "${packages[$i]}"
done;
