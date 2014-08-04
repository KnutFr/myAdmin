<?php session_start();
		mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
		mysql_select_db($_POST['database']);
	if (!isset($_POST['insertSend'])) {
		$req = mysql_query("DESCRIBE " . $_POST['table']);
		echo "<p>Insérer une nouvelle entrée dans la table : " . $_POST['table'] . "." . $_POST['database'] . ".</p>";
		echo "<form method=\"POST\" action=\"ajax/insertForm.php\">
		<table>";
		while ($result = mysql_fetch_assoc($req)) {
	   		echo "<tr><td><label>" . $result['Field'] . " </label></td><td><input name=\"".$result['Field']."\" type=\"text\" /></td></tr>";
	  	}
	  	echo "<input type=\"hidden\" name=\"stable\" value=\"" . $_POST['table'] . "\"/>";
	  	echo "<input type=\"hidden\" name=\"database\" value=\"" . $_POST['database'] . "\"/>";
		echo "<tr><td></td><td align=\"right\"><input id=\"insertSend\" name=\"insertSend\" type=\"submit\" /></td></tr></table>
	  		</form>
	  		</div>";
	}
	else {
		$rows = array();
		$values = array();
		$i = 0;
		unset($_POST[count($_POST) - 1]);
		foreach ($_POST as $key => $value) {
			$rows[$i] = $key;
			$values[$i++] = $value;
		}
		$len = count($_POST) - 1;
		unset($rows[$len]);
		unset($values[$len - 1]);
		unset($values[$len - 2]);
		unset($values[$len]);
		for ($i = 0; isset($values[$i]); $i++)
			$values[$i] = "'" . $values[$i] . "'";
		mysql_query("INSERT INTO " . $_POST['stable'] . " VALUES (" . implode(',', $values) . ")");
		header("Location: ../index.php");
	}

?>

<script>
jQuery("#insertSend").click(function () {
confirm("La ligne a bien été ajoutée");
});
</script>