#!/bin/bash

for md_file in $(ls **/*.md)
do
    pandoc -s \
	   --wrap=preserve \
	   --lua-filter=${HOME}/dotfiles/remove-header-attr.lua \
	   -t org \
	   -f markdown \
	   ${md_file} -o ${md_file/\.md/.org}
done
