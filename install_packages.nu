# Install all headless packages
(yay -Syu --needed
    git
    nushell
    neovim
    zellij
    zoxide
    rtx
    bat
    fd
    fzf
    jq
    imagemagick
    docker
    docker-compose
    docker-buildx
    helm
    kubectl
    kubie
    k9s
    gomplate-bin)

# If not a headless install then also install all GUI related stuff
if not $env.CHEZMOI_HEADLESS {
    (yay -Syu --needed
        wev
        wireplumber
        ffmpeg
        mpv
        ly
        blight
        sway
        swaybg
        grim
        slurp
        mako
        alacritty
        noto-fonts
        noto-fonts-emoji
        ttf-jetbrains-mono
        ttf-jetbrains-mono-nerd)
}
