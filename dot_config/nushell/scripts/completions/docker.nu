def "nu-complete docker container active names" [] {
    ^docker ps --format json
    | lines
    | each { from json }
    | get Names
}

def "nu-complete docker container inactive names" [] {
    ^docker ps --format json -f "status=exited"
    | lines
    | each { from json }
    | get Names
}

export extern "docker start" [
    container: string@"nu-complete docker container inactive names" # The name of the container
    --attach(-a) # Attach STDOUT/STDERR and forward signals
    --detach-keys: string # Override the key sequence for detaching a container
    --interactive(-i) # Attach container's STDIN
]

export extern "docker stop" [
    container: string@"nu-complete docker container active names" # The name of the container
    --signal(-s): string # Signal to send to the container
    --time(-t): int # Seconds to wait before killing the container
]

export extern "docker attach" [
    container: string@"nu-complete docker container active names" # The name of the container
    --detach-keys string # Override the key sequence for detaching a container
    --no-stdin # Do not attach STDIN
    --sig-proxy # Proxy all received signals to the process (default true)
]
