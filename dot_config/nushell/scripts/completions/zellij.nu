def "nu-complete zellij list sessions" [] {
    ^zellij list-sessions -ns
    | lines
}

export extern "zellij attach" [
    ...session: string@"nu-complete zellij list sessions" # The name of the session to attach to
    --create(-c) # Create a session if one does not exist
    --help(-h) # Print help information
    --index: int # Number of the session index in the active sessions ordered creation date
]
