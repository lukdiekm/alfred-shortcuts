printf "<?xml version=\"1.0\" encoding=\"UTF-8\"?><items>"
IFS=''
shortcuts list |
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