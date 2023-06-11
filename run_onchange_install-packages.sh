#!/bin/sh
{{ if eq index .Env "CHEZMOI_HEADLESS" true }}
    echo "Its headless!"
{{ else }}
    echo "Its normale mode"
{{ end }}
