#!/bin/bash
for entry in "$search_dir"/*
do
    python3 $entry
    if [ $? -eq 0 ]; then
        echo ''
    else
        echo $entry
fi
done

