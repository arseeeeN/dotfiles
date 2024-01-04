# Dotfiles

The goal with my setup is to only have what I need and follow the UNIX philosophy of using simple programs that can be composed together to build complex systems.

The look is minimal and unobtrusive, using the [oxocarbon](https://github.com/nyoom-engineering/oxocarbon) color scheme. The goal of this setup was not to [rice](https://wiki.installgentoo.com/index.php/GNU/Linux_ricing) it to perfection but to make it as boring and usable as possible while still looking stylish and clean.

# Overview

A short overview of what I think are the most important parts of the setup and my daily workflow:

- **Distribution**: [Arch Linux](https://archlinux.org/)
- **Window Manager**: [Sway](https://github.com/swaywm/sway)
- **Shell**: [Nushell](https://github.com/nushell/nushell)
- **Editor**: [Neovim](https://github.com/neovim/neovim)
- **Terminal Multiplexer**: [Zellij](https://github.com/zellij-org/zellij)
- **Version Manager**: [mise](https://github.com/jdx/mise)

# How to use

Because I tried to keep everything as simple as possible, most of my setup should be usable right away if you know how to use the tools listed above.
This repo was created using `chezmoi`, so if you want to copy everything as is then using chezmoi is the easiest way.

## Keybindings

A lot of the keybindings are left default on purpose with a few exceptions that can all be observed in their respective configuration files. For basic usage, the Sway config file is a good starting place.

## Editor

The most complex program in my setup is probably by far my editor, Neovim. This is because of its high customizability and the fact that it's my main code editor, so it has to have all the necessary features to accomplish that task.

I still tried to keep my Neovim config as lightweight, portable and clean as possible but that requires a few setup steps to get working. The most manual one being the installation of all the runtimes and compilers via `mise`.

If you do not wish to use `mise` but want to install everything using your main package manager then you need to change some preconfigured paths in the configuration code. Currently there is no single place where these things are defined as I didn't have the need for it, maybe that will change in the future.

The second step, which is mostly done automatically, is to install and configure the language servers and debuggers for the languages you use. This is done via `:Mason` inside Neovim and the configurations are in the `plugins/lsp/` and the `plugins/dap/` folders. I have the ones I use set up for auto installation and they should work without any additional fuss after you install them via Mason.

There are a couple ways to add additional LSPs and DAPs to the config:

- Add them to the server list (`opts.servers` in `plugins/lsp/init.lua`) and let [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) do the configuration work for you. You can also override those defaults in the configuration object of the server list.
- Do the step above but also use a dedicated plugin for the LSP/DAP to get its full feature set (e.g. [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) or [rust-tools](https://github.com/simrat39/rust-tools.nvim)). You often times need to add a custom setup hook for these things (`opts.setup` in `plugins/lsp/init.lua`), so that nvim-lspconfig knows that something else is taking care of the LSP or DAP startup.

Generally speaking the LSPs ecosystem is a lot looser and needs more work to get functioning. DAPs are mostly quite straightforward (albeit not yet that mature in Neovim), because of VSCode standardizing the way they are used.

## Other stuff

Nushell is great, sometimes a bit buggy as it's still quite new but I take that any day of the week over writing bash scripts. For instructions on how to use it, their [website](https://www.nushell.sh/) has decent documentation.

The tool I use the most outside of all the things mentioned above is `z` or [zoxide](https://github.com/ajeetdsouza/zoxide). If you are still using `cd` to navigate through your whole file system then ~I am very sorry for you~ I advise you to check out zoxide or similar directory navigators (e.g. [autojump](https://github.com/wting/autojump), [bashmarks](https://github.com/huyng/bashmarks)).
