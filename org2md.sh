#!/bin/bash

for org_file in $(ls *.org)
do
    pandoc -f org -t markdown ${org_file} -o ${org_file/\.org/.md}
done
