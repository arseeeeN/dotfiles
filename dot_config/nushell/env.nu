def create_left_prompt [] {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)/($path_color)"
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | date format '%Y/%m/%d %r')
    ] | str join | str replace --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# $env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| " > " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| " : " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| " > " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# Kubernetes config
if ($"($nu.home-path)/.kube" | path exists) {
    let kubeconfig_file = if ($"($nu.home-path)/.kube/config" | path exists) {
        $"($nu.home-path)/.kube/config"
    }
    $env.KUBECONFIG = (ls ~/.kube/
        | find --regex ".*\\.ya?ml"
        | where name !~ "kubie.ya?ml"
        | get name
        | prepend $kubeconfig_file
        | str join ":")
}

$env.VISUAL = "nvim"
$env.EDITOR = "nvim"
$env.SHELL = "nu"

$env.MOZ_ENABLE_WAYLAND = 1
$env.XDG_CURRENT_DESKTOP = "sway"
if not (which catalina.sh | is-empty) {
    $env.CATALINA_HOME = (which catalina.sh
        | first | get path
        | path parse | get parent
        | path parse | get parent
    )
}

# TODO: I hope nushell changes the way const stuff works,
#       having these paths everywhere is quite ugly.
#       Why isn't $nu.default-config-dir const??
const vars_nu_path = "~/.config/nushell/vars.nu"
if ($vars_nu_path | path exists) {
    source $vars_nu_path
}

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend $"($env.HOME)/.cargo/bin"
    | prepend $"($env.HOME)/.wasmer/bin"
    | prepend $"($env.HOME)/bin"
)

zoxide init nushell | save -f ($nu.default-config-dir | path join "scripts" "integrations" "zoxide.nu")
