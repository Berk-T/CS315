#!/bin/bash
_mydir="$(pwd)"
FILES=$_mydir/examples/*

make

for f in $FILES
do
    cat $f | ./parser
done