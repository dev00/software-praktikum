	<?php

		$verbindung = mysql_connect ("localhost",
		"root", "")
		or die ("keine Verbindung moeglich.
		 Benutzername oder Passwort sind falsch");

		mysql_select_db("pizzaria")
		or die ("Die Datenbank existiert nicht.");


		$abfrage = "SELECT * FROM pizza";
		$ergebnis = mysql_query($abfrage);
		while($row = mysql_fetch_object($ergebnis)){
			echo "Nr: $row->ID, 
			Name: $row->name,
			Inhalt: $row->beschreibung,
			$row->zutaten, </br>
			Preis:$row->preis <br>";
		}
	?>