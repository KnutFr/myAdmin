<?php session_start(); ?>
<?php if (isset($_SESSION['username']))
	header('Location:index.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>my_phpmyadmin | Login</title>
		<link rel="stylesheet" type="text/css" href="style/login.css" media="screen" title="bbxcss" />
	</head>
	<body>
		<img id="logo" src="images/login_logo.png">
		<form id="start" method="post" action="index.php" autocomplete="off">
			<h1>Bienvenue dans my_phpmyadmin</h1>
			<p>
				<label for="server">Server</label>
				<input name="server" id="server" type="text" />
			</p>
			<p>
				<label for="username">Login</label>
				<input name="username" id="username" type="text" />
			</p>
			<p>
				<label for="password">Password</label>
				<input name="password" id="password" type="password" />
			</p>
			<div>
				<input class="submit" type="submit" value="S'identifier"/>
			</div>
		</form>
		<p id="meta"> &#169; 2012-2013 - mySQLAdmin</p>
	</body>
</html>