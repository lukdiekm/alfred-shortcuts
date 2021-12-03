#!/bin/bash

getIcon() {
    IFS=','
    read -raarr <<<"$colors"
    for color in "${arr[@]}"; do
        IFS='='
        read -ratmp <<<"$color"
        if [[ "${tmp[0]}" == "$1" ]]; then
            echo "${tmp[1]}.png"
            return 0
        fi
    done
    echo "icon.png"
    IFS=''
}

printShortcut() {
    printf "<item uid=\"%s\" valid=\"YES\" autocomplete=\"%s\">" $1 $2
    printf "<title>%s</title>" $1
    printf "<subtitle>%s</subtitle>" $2
    printf "<icon>icons/%s</icon>" $3
    printf "<arg>%s</arg>" $1
    printf "</item>"
}

printFolder() {
    ic=$(getIcon "$folder")
    shortcuts list --folder-name "$folder" |
        while read shortcut; do
            printShortcut $shortcut $folder $ic
        done
}

printf "<?xml version=\"1.0\" encoding=\"UTF-8\"?><items>"
IFS=''

if [[ ! -z "$folders" ]]; then
    IFS=','
    read -ra arr <<<"$folders"
    for folder in "${arr[@]}"; do
        printFolder "$folder"
    done
    IFS=''
elif [[ ! -z "$folder" ]]; then
    printFolder "$folder"
else
    shortcuts list --folders |
        while read folder; do
            printFolder "$folder"
        done
fi
echo "</items>"
