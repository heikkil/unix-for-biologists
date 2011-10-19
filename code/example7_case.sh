#!/bin/bash
# example7_case.sh

function usage() {
    echo "Usage: $0 {dna|protein} seq"
    exit 1
}

function translate {
  # do something
}

function hydropathy {
  # do something
}

case "$1" in
    'dna')
        translate
        ;;
    'protein')
        hydropathy
        ;;
    *)
        usage
esac
