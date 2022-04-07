#!/usr/bin/bash
#
# Name    : Auto Rice Bootstrapping
# Author  : Abd El-Twab M. Fakhry <abdeltwab.m.fakhry at gmail.com>
# License : GNU GPLv3

OPT_DIR="$HOME/.local/opt"
GITHUB_BASE_URL="https://github.com"
GITHUB_USER_NAME="AbdeltwabMF"

make_dirs() {
		mkdir -p "${OPT_DIR}"/suckless
}

install_suckless_utils() {
	declare -a repositories
	repositories=(dwm dwmblocks st surf slock tabbed dmenu)

	# Clone repositories
	for((i = 0; i < ${#repositories[@]}; i++)); do
		git clone "${GITHUB_BASE_URL}/${GITHUB_USER_NAME}/${repositories[i]}.git" "${OPT_DIR}/suckless/${repositories[i]}"
	done

	# Install suckless utils using sudo previleges
	for((i = 0; i < ${#repositories[@]}; i++)); do
		cd "${OPT_DIR}/suckless/${repositories[i]}" || return
		sudo make install clean
	done
}

make_dirs
install_suckless_utils
