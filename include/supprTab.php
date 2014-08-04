<?php session_start();


mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);

if(isset($_GET['table']))
{
	$table = $_GET['table'];
	$sql = "DROP DATABASE IF EXISTS ". $table;
	mysql_query($sql) or die ("Erreur SQL : " .$sql); 
}
	header('Location:../index.php');

?>