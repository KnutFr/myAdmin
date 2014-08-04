<?php
function 	getNbTables($database) {
	mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
	mysql_select_db($database);
	$req = mysql_query("SHOW TABLES");
	return mysql_num_rows($req);
}

function	getNbRows($table) {
  $ress = mysql_query("SELECT COUNT(*) as nb FROM " . $table);
  $result = mysql_fetch_assoc($ress);
  return $result['nb'];
}

?>