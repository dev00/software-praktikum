<?php
		$verbindung = mysql_connect ("localhost",
		"root", "")
		or die ("keine Verbindung moeglich.
		 Benutzername oder Passwort sind falsch");

		mysql_select_db("pizzeria")
		or die ("Die Datenbank existiert nicht.");


		$abfrage = "SELECT * FROM pizza";
		$ergebnis = mysql_query($abfrage);
?>
