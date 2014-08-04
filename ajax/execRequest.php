<?php
	session_start();
	$query = $_POST['query'];
	$table = $_POST['table'];
	$database = $_POST['database'];
	if ($query == "select_all")
		$q = "SELECT * FROM " . $table;
	else if ($query == "describe_table")
		$q = "DESCRIBE " . $table;
	mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
	mysql_select_db($database);
	$req = mysql_query($q);
	$i = 0;
	while ($result = mysql_fetch_assoc($req)) {
		if ($i == 0) {
			echo "<table class=\"table\"><thead><tr>";
			$keys = array_keys($result);
			foreach ($keys as $value) {
				echo "<th>" . $value . "</th>";
			}
			echo "</tr></thead><tbody>";
			$i++;
		}
		echo "<tr>";
		foreach ($result as $value) {
			if (isset($value))
			 	echo "<td>" . $value . "</td>";
			else
				echo "<td>NULL</td>";
		}
		echo "<td>
			<a class=\"TablesLines\" href=\"box/deleterec.php?table=".$table."&database=".$database."\"
		 	title=\"Information\" onclick=\"Modalbox.show(this.href, {title: this.title, width: 600}); return false;\">
		 	<img title='Supprimer' src='images/delete.png' /></a></td>"; 
		echo "</tr>";
	}
	echo "</tbody></table>


	";
?>