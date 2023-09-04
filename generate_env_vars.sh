vars_file_path=~/.config/nushell/vars.nu

printf "\055\055 Installation Options\n"
printf "Do you want to install all desktop related packages? (window manager, GUI programms, etc.)\n"
printf "If you choose no then a headless install will be performed.\n"
printf "[y/n]: "
read -r headless </dev/tty

set_env(){
    printf "Setting $1=$2\n"
    echo "\$env.$1 = $2" >> $vars_file_path
    export $1=$2
}

while true; do
    case $headless in
        [Yy]*)
            set_env CHEZMOI_HEADLESS false
            break
            ;;
        [Nn]*)
            set_env CHEZMOI_HEADLESS true
            break
            ;;
        *)
            printf "Invalid input. Please enter 'y' or 'n'.\n"
            ;;
    esac
done
