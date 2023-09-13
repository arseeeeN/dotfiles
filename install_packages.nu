# Install all headless packages
(yay -S --needed
    git
    nushell
    neovim
    zellij
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
    (yay -S --needed
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
