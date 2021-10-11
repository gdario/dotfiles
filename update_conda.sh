#!/bin/bash

conda update conda

for env in $(conda env list | tail -n +3 | cut -f1 -d ' ')
do
    echo "Updating conda environment: ${env}"
    conda update -n ${env} --all -y
done

