for formula in $(brew list)
do
    echo '-----------------------------------------------------------'
    echo "                        ${formula}"
    echo '-----------------------------------------------------------'
    echo "Depends on: " $(brew deps ${formula} --installed) 
    echo "Is used by: " $(brew uses ${formula} --installed)
    echo
done
