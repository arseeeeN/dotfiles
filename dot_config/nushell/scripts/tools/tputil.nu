# Prepares the component for being intercepted
export def prepare [
    component_name: string
    release_name: string
] {
    prepare_intercept $component_name $release_name 0
}

# Resets the telepresence intercept config on the given component
export def reset [
    component_name: string
    release_name: string
] {
    prepare_intercept $component_name $release_name 1000
}

def prepare_intercept [
    component_name: string
    release_name: string
    permission_level: int
] {
    let stateful_set = (kubectl get sts -l $"component=($component_name),release=($release_name)" -o name)
    kubectl patch $stateful_set -p $'{"spec": {"template": {"spec": {"securityContext": {"runAsUser": ($permission_level)}}}}}'
}
