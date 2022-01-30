#!/bin/bash

function single() {
    inkscape -h $1 whiskers.svg --export-filename whiskers_$1x$1.png
}

single 32
single 64
single 128
single 256
single 512
single 1024
