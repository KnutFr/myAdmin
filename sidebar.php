<nav>
	<div id="logo">
		<a href="index.php"><img src="images/logo.png" /></a>
		<div>
			<a href="index.php"><img src="images/b_home.png"/></a>
			<a href=""><img src="images/b_selboard.png"/></a>
			<a href=""><img src="images/b_docs.png"/></a>
			<a href="http://dev.mysql.com/doc/refman/5.5/en/index.html"><img src="images/b_sqlhelp.png"/></a>
			<a href="logout.php"><img src="images/logout.png"/></a>
		</div>
	</div>
	<div id="databases">
		<?php 
		try {
   $bdd = new PDO("mysql:host=" . $_SESSION['server'],
		  $_SESSION['username'],
		  $_SESSION['password']);
		} catch (PDOException $e) {
			echo 'Connection failed : ' . $e->getMessage();
		}
		$query = $bdd->query("SHOW DATABASES");
		echo "<ul>"; 
		while (($result = $query->fetch(PDO::FETCH_ASSOC))) {
			$database = $result['Database'];
			echo "<li><a href='#' onclick=\"showTables('$database'); return false;\";>" . $database . " (" . getNbTables($database) .")</a></li>";
		}
			
		echo "</ul>";

		if(isset($_POST['tablename']))
		{
			try
			{
				$query = $bdd->exec("CREATE DATABASE " . $_POST['tablename']);
			}
			catch (Exception $e)
			{
				echo "<div class='error'>La base existe déja</div>";
			}
			header("Location: index.php");
		}
		?>
	</div>
	<div id="tablesRequest">
		<p>Choisissez une base de donn&eacute;es.</p>
	</div>
	<form action="#" method="post">
		<input type="text" name="tablename"><br/>
	<a href=""><input type="submit" value="Créer une base"></a>
</form>
</nav>