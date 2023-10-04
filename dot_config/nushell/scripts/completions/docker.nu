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

def "nu-complete docker container all names" [] {
    ^docker ps -a --format json
    | lines
    | each { from json }
    | get Names
}

export extern "docker start" [
    ...containers: string@"nu-complete docker container inactive names" # The names of the containers
    --attach(-a) # Attach STDOUT/STDERR and forward signals
    --detach-keys: string # Override the key sequence for detaching a container
    --interactive(-i) # Attach container's STDIN
]

export extern "docker stop" [
    ...containers: string@"nu-complete docker container active names" # The names of the containers
    --signal(-s): string # Signal to send to the container
    --time(-t): int # Seconds to wait before killing the container
]

export extern "docker attach" [
    container: string@"nu-complete docker container active names" # The name of the container
    --detach-keys string # Override the key sequence for detaching a container
    --no-stdin # Do not attach STDIN
    --sig-proxy # Proxy all received signals to the process (default true)
]

export extern "docker logs" [
    container: string@"nu-complete docker container all names" # The name of the container
    --details # Show extra details provided to logs
    --follow(-f) # Follow log output
    --since: string # Show logs since timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)
    --tail(-n): string # Number of lines to show from the end of the logs (default "all")
    --timestamps(-t) # Show timestamps
    --until: string # Show logs before a timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)
]
