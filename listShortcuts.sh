getShortcuts () {
if [[ ! -z "$folders" ]]; then
    IFS=','
    read -a arr <<<"$folders"
    for folder in "${arr[@]}"; do
        shortcuts list --folder-name "$folder"
    done
    IFS=''
elif [[ ! -z "$folder" ]]; then
    shortcuts list --folder-name "$folder"
else
    shortcuts list
fi
}

printf "<?xml version=\"1.0\" encoding=\"UTF-8\"?><items>"
IFS=''

getShortcuts |
while read shortcut
do
    printf "<item uid=\"%s\" valid=\"YES\" autocomplete=\"%s\">" $shortcut $shortcut
    printf "<title>%s</title>" $shortcut
    printf "<subtitle>%s</subtitle>" $shortcut
    printf "<icon>sc-icon.png</icon>"
    printf "<arg>%s</arg>" $shortcut
    printf "</item>"
done
echo "</items>"