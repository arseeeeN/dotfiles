vars_file_path = ~/.config/nushell/vars.nu

printf "-- Installation Options" >&2
printf "Do you want to install all desktop related packages? (window manager, GUI programms, etc.)" >&2
printf "If you choose no then a headless install will be performed." >&2
printf "[y/n]: " >&2
read -r headless </dev/tty

while true; do
    case $headless in
        [Yy]*)
            printf "Setting CHEZMOI_HEADLESS=\"false\""
            export CHEZMOI_HEADLESS="false"
            echo "CHEZMOI_HEADLESS=\"false\"" >> $vars_file_path
            break
            ;;
        [Nn]*)
            printf "Setting CHEZMOI_HEADLESS=\"true\""
            export CHEZMOI_HEADLESS="true"
            echo "CHEZMOI_HEADLESS=\"true\"" >> $vars_file_path
            break
            ;;
        *)
            printf "Invalid input. Please enter 'y' or 'n'.\n"
            ;;
    esac
done
