<?php
session_start();
$database = $_REQUEST['database'];
$_SESSION['database'] = $database;

require_once '../fonctions.php';

$data = "<p style='text-align:center;'>BDD sélectionnée :<br />" . $database . "</p>";
mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
mysql_select_db($database);	
$req = mysql_query("SHOW TABLES");
echo mysql_error();
if (mysql_num_rows($req) == 0) {
  echo $data . "Il n'y a pas de table pour le moment. <br />";
  return null;
}
$data .= "<ul id='tableslist'>";
while ($result = mysql_fetch_assoc($req)) {
  $table = $result["Tables_in_" . $database];
  $data .= "<a href='#' onClick=\"execQuery('select_all', '" . $table."', '".$database."'); return false;\"><li>" . $table. " (".getNbRows($table).")</li></a>";
}
$data .= "</ul>";
echo $data;
?>
