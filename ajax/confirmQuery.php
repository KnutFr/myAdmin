	<?php
session_start();
function    displayLinkShowLines($table, $database) {
  $req = mysql_query("SELECT * FROM " . $table);
  $numRows = mysql_num_rows($req);
  if ($numRows > 0)
    $ret = "<a class=\"TablesLines\" href=\"#\" onClick=\"execQuery('select_all', '".$table."', '".$database."'); return false;\"><img title='Afficher' src='images/displaytable.png'/></a>";
  else
    $ret = "<img src='images/empty.png'title='Table vide'/>";
  return $ret;
}

function    displayNumRows($table) {
  $req = mysql_query("SELECT * FROM " . $table);
  return mysql_num_rows($req);
}


	$database = $_POST['database'];
	mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
	mysql_select_db($database);
	if ($_POST['query'] == "TRUNCATE")
		mysql_query("TRUNCATE " . $_POST['table']);
	else if ($_POST['query'] == "DROP")
		mysql_query("DROP TABLE " . $_POST['table']);
	$req = mysql_query("SHOW TABLES");
	
	echo "
	<table class=\"table\">
	   <thead>
	       <tr>
	           <th>Table</th>
	           <th colspan=5>Action</th>
	           <th>Lignes</th>
	       </tr>
	   </thead>
	   <tbody>";
	while ($result = mysql_fetch_assoc($req)) {
		$table = $result["Tables_in_" . $database];
	  echo "
		<tr>
			<td class=\"firstCell\">" . $table . "</td>
	    <td>" . displayLinkShowLines($table, $database) . "</td>
	    <td><a class=\"TablesLines\" href=\"#\" onClick=\"execQuery('describe_table', '".$table."', '".$database."'); return false;\"><img title='Structure' src='images/structure.png'/></a></td>
	    <td><a class=\"TablesLines\" href=\"box/insert_box.php\" title=\"Information\" onclick=\"Modalbox.show(this.href, {title: this.title, width: 600}); return false;\">
	    <img title='Insérer' src='images/insert.png' /></a></td>
	    <td><a class=\"TablesLines\" href=\"box/truncate_box.php?table=".$table."\" title=\"Information\" onclick=\"Modalbox.show(this.href, {title: this.title, width: 600}); return false;\"><img title='Vider' src='images/drop.png' /></a></td>
	    <td><a class=\"TablesLines\" href=\"box/delete_box.php\" title=\"Information\" onclick=\"Modalbox.show(this.href, {title: this.title, width: 600}); return false;\"><img title='Supprimer' src='images/delete.png' /></a></td>
	    <td class=\"align_right\">" . displayNumRows($table) . "</td>
		</tr>";
	}
	echo "</tbody></table>";
?>