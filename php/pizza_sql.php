<?php
$mysqli = new mysqli("localhost", "root", "", "pizzeria");

/* check connection */
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}
if (!$mysqli->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $mysqli->error);
}
/* Select queries return a resultset */
if ($result = $mysqli->query("SELECT * FROM pizza")) {
   
    while ($row = $result->fetch_object()) {
	echo "<div class=\"post\">";
	echo "	<h2 id=\"$row->name\">Pizza $row->name</h2>";
	echo "	<div class=\"row\">";
	echo "		<div class=\"col-sm-3\">";
	echo "			<img src=\"img/$row->name.jpg\" class=\"img-responsive hidden-xs img-rounded\">";
	echo "		</div>";
	echo "		<div class=\"col-sm-6\">";
	echo "			<p>$row->beschreibung</p>";
	echo "		</div>"	;		
	echo "		<div class=\"col-sm-3\">";
	echo "			<p>Preis S: $row->preis_s</p>";
	echo "			<p>Preis M: $row->preis_m</p>";
	echo "			<p>Preis L: $row->preis_l</p>";
	echo "			<p><img src=\"img/bestell.jpg\" class=\"img-responsive\"></p>";
	echo "		</div>";
	echo "	</div>";
	echo "</div>";

    /* free result set */
	}
	$result->close();
};