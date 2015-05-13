<?php
	$mysqli = new mysqli("localhost", "root", "", "pizzeria");

	/* check connection */
	if ($mysqli->connect_errno) {
	    printf("Connect failed: %s\n", $mysqli->connect_error);
	    exit();
	}
if (!$mysqli->set_charset("utf8")) {
    echo("Error loading character set utf8: %s\n", $mysqli->error);
}
	/* Select queries return a resultset */
	if ($result = $mysqli->query("SELECT name FROM pizza")) {
	   
	    while ($row = $result->fetch_object()) {
			echo "<li><a href=\"$row->name\">$row->name</a></li>";
	    /* free result set */
		}
		$result->close();
	}
?>