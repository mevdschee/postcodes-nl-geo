<?php
$r = fopen("php://stdin", "r");
$w = fopen("php://stdout", "w");
fputcsv($w, array_slice(fgetcsv($r), 0, 8));
while ($line = fgetcsv($r)) {
    $record = array_slice($line, 0, 8);
    $record[6] = $record[6] == -1 ? '' : round(floatval($record[6]));
    $record[7] = $record[7] == -1 ? '' : round(floatval($record[7]));
    fputcsv($w, $record);
}
fclose($r);
fclose($w);
