<?php session_start(); ?>
<?php 
	mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
	mysql_select_db($_GET['database']);
	$req = mysql_query("DESCRIBE " . $_GET['table']);
?>
<div id="insertForm">
	<form method="POST" action="#">
		<?php
			while ($result = mysql_fetch_assoc($req)) {
				echo "<label>" . $result['Field'] . " : </label><input type=\"text\" /><br />";
			}
		?>
		<input type="submit" />		
	</form>
<!--
    <p onClick="confirmQuery('TRUNCATE', '<?php echo $_GET['table'] ?>', '<?php echo $_GET['database'] ?>'); return false;">Oui</p>
    <p onClick="Modalbox.hide();">Non</p>
-->
</div>
