<?php
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?><items>";
exec('shortcuts list', $data);
foreach ($data as $shortcut) {
    echo "<item uid=\"'{$shortcut}\" valid=\"YES\" autocomplete=\"{$shortcut}\">";
    echo "<title>{$shortcut}</title>";
    echo "<subtitle>{$shortcut}</subtitle>";
    echo "<icon>sc-icon.png</icon>";
    echo "<arg>{$shortcut}</arg>";
    echo "</item>";
}
echo "</items>";
