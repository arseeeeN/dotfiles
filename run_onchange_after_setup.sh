#!/bin/sh

main() {
    # Install yay if it doesn't exist
    if ! command -v yay &> /dev/null
    then
        pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd ..
        rm -rf ./yay
    fi

    # Setup env vars
    vars_file_path=~/.config/nushell/vars.nu
    if [[ ! -f "$vars_file_path" ]]; then
        setup_env_headless
    fi

    # Update packages and install nushell
    yay -Syu --needed nushell

    # Install all other packags
    nu ./install_packages.nu
}

# TODO: Potentially move the env var creation to a nushell script and only do the bare minimum setup in bash
# TODO: Find a way to recognize if a new variable got added/is missing in the existing vars.nu file and prompt that one
setup_env_headless() {
    printf "\055\055 Installation Options\n"
    printf "Do you want to install all desktop related packages? (window manager, GUI programms, etc.)\n"
    printf "If you choose no then a headless install will be performed.\n"
    prompt_env CHEZMOI_HEADLESS
}

prompt_env() {
    while true; do
        printf "[y/n]: "
        read -r bool </dev/tty
        case $bool in
            [Yy]*)
                set_env $1 false
                break
                ;;
            [Nn]*)
                set_env $1 true
                break
                ;;
            *)
                printf "Invalid input. Please enter 'y' or 'n'.\n"
                ;;
        esac
    done
}

set_env() {
    printf "Setting $1=$2\n"
    echo "\$env.$1 = $2" >> $vars_file_path
    export $1=$2
}

main "$@"
