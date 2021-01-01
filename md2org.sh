#!/bin/bash

for md_file in $(ls *.md)
do
    pandoc -t org -f markdown ${md_file} -o ${md_file/\.md/.org}
done
