# TODO: This could be improved by allowing multiple matches to be iterated instead of only taking the first.
# That could be made a cli flag, something like --recursive (-r)
export def main [path: string] {
    try {
        $path
        | path split
        | if ($in | first) == "." {
            range 1..
        } else { $in }
        | if ($in | length) == 1 {
            validate_and_get (glob $in.0) $in.0
        } else { $in }
        | reduce {|it, acc|
            validate_and_get ($acc | path join $it | glob $in) $it
        }
    } catch {
        print -e $in.msg
    }
}

def validate_and_get [
    res: list<string>
    el: string
] {
    if ($res | is-empty) {
        error make { msg: $"Glob matching failed on path element: \"($el)\"" }
    }
    $res | first
}
