export def --env main [file: path = .env] {
    open $file
    | lines
    | parse -r '(?P<k>.+?)=(?P<v>.+)'
    | reduce -f {} {|x, acc| $acc | upsert $x.k $x.v}
    | load-env
}
