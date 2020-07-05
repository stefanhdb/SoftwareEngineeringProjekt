Gruppe D
Teilnehmer:
Nicholas Fischer: 319206
Stefan Hillenbrand: 319256
Dorukhan Ileri: 317894

Anleitung:
Bislang haben wir das Programm über den "Red Hat JBoss EAP 7.0" Server laufen lassen.
Damit die Anbindung zur Datenbank funktioniert müssen sie in der Datei "API\Test\DbConnection" in Zeile 32 den kompletten Dateipfad zu der "Leaderboard.db" Datenbank angeben.
Leider fängt RedHat DevStudio, die Suche nach dem Dateipfad ab dem Ordner, wo JBoss installiert ist an, weshalb man den Dateipfad nicht abkürzen kann.
