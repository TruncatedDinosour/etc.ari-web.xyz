#!/usr/bin/env bash

set -e

S='./scripts'
SCRIPTS=(index minjs mincss minhtml)

main() {
    for script in "${SCRIPTS[@]}"; do
        _s="$S/$script.sh"

        chmod +x -- "$_s"
        "$_s" &
    done

    wait

    ./scripts/netlify.sh
}

main "$@"
