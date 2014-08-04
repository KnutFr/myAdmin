<?php session_start(); ?>
<?php require_once 'fonctions.php'; ?>
<?php
if (isset($_POST['username']) && $_POST['username'] !== "") {
	$mysqli = new mysqli($_POST['server'], $_POST['username'], $_POST['password']);
	if ($mysqli->connect_error) 
	{
	    die('Connexion Error : (' . $mysqli->connect_errno . ') '
	            . $mysqli->connect_error);
		unset($_SESSION['username']);
		header('Location: login.php');
	}
	else {
		$_SESSION['server'] 	= $_POST['server'];
		$_SESSION['username'] = $_POST['username'];
		$_SESSION['password'] = $_POST['password'];		
	}
	$mysqli->close();
}
if (!isset($_SESSION['username']))
	header('Location: login.php');
?>

<html>
	<head>
		<title>my_phpmyadmin</title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />	
		<link rel="stylesheet" type="text/css" href="style/style.css" />


		<link rel="stylesheet" href="js/box/modalbox.css" type="text/css" media="screen" />
	</head>
	<body>
		<?php require_once 'sidebar.php';?>
		<?php require_once 'content.php'; ?>
		<?php require_once 'footer.php'; ?>
	</body>
</html>
