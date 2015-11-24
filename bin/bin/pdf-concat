#! /usr/bin/env bash

# Concatenates a list of PDF files using Ghostscript
# $1 = output pdf
# $2.. = list of pdfs to concatenate
# Dependencies: ghostscript

OUTPUT="$1"
shift
ARGS="$*"

/usr/bin/gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$OUTPUT" $ARGS

