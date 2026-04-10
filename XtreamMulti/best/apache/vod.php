<?php
// Den Query-String analysieren
$cmd = $_GET['cmd'] ?? ''; // Den Wert des cmd-Parameters erhalten (falls vorhanden)
$series = $_GET['series'] ?? ''; // Den Wert des series-Parameters erhalten (falls vorhanden)

// Pfad zum Skript
$scriptPath = '/data/data/com.termux/files/home/xtreammulti/best/vodphp.sh';

// Befehl zusammenstellen (falls erforderlich)
$command = $scriptPath . " \"$cmd\" \"$series\""; // Leerzeichen und Punkt hinzufügen

// Den Befehl ausführen und Ergebnis speichern
$output = exec($command);

// Ergebnis als Location-Header zurückgeben
header('Location: ' . $output);
exit(); // Exit, um sicherzustellen, dass keine weitere Ausgabe erfolgt
?>
