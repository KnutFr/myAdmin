<?php
session_start();
function    displayLinkShowLines($table, $database) {
  $req = mysql_query("SELECT * FROM " . $table);
  $numRows = mysql_num_rows($req);
  if ($numRows > 0)
    $ret = "<a class=\"TablesLines\" href=\"#\" onClick=\"execQuery('select_all', '".$table."', '".$database."'); return false;\"><img title='Afficher' src='images/displaytable.png'/>Afficher</a>";
  else
    $ret = "<img src='images/empty.png'title='Table vide'/> Vide";
  return $ret;
}

function    displayNumRows($table) {
  $req = mysql_query("SELECT * FROM " . $table);
  return mysql_num_rows($req);
}

$database = $_REQUEST['database'];

mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
mysql_select_db($database);
$req = mysql_query("SHOW TABLES");
if (mysql_num_rows($req) == 0) {
  echo "Il n'y a pas de table pour le moment. Voulez vous en creer une ? <br/>";
  echo "<form action='index.php?db=".$database."' method = 'post'>
  <input type='text' name='nametable'> <input type='submit' value='Creer une table'></a></form>";
  exit();
}
$data =  "
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
  $data .= "
	<tr>
		<td class=\"firstCell\">" . $table . "</td>
    <td>" . displayLinkShowLines($table, $database) . "</td>
    <td><a class=\"TablesLines\" href=\"#\" onClick=\"execQuery('describe_table', '".$table."', '".$database."'); return false;\"><img title='Structure' src='images/structure.png'/>Structure</a></td>
    <td><a class=\"insertButton\" href=\"#\" rel=\"". $table . "|" . $database . "\"><img title='Insérer' src='images/insert.png' />Ins&eacute;rer</a></td>
    <td><a class=\"TablesLines\" href=\"box/truncate_box.php?table=".$table."&database=".$database."\" title=\"Information\" onclick=\"Modalbox.show(this.href, {title: this.title, width: 600}); return false;\"><img title='Vider' src='images/drop.png' />Vider</a></td>
    <td><a class=\"TablesLines\" href=\"box/delete_box.php?table=".$table."&database=".$database."\" title=\"Information\" onclick=\"Modalbox.show(this.href, {title: this.title, width: 600}); return false;\"><img title='Supprimer' src='images/delete.png' />Supprimer</a></td>
    <td class=\"align_right\">" . displayNumRows($table) . "</td>
	</tr>";
}
$data .= "</tbody></table>";
echo $data;
?>

<script>
jQuery(".insertButton").click(function(e) {
    var data = jQuery(this).attr("rel").split('|');
    jQuery.ajax({
      type: "POST",
	  url: "ajax/insertForm.php",
	  data: {table:data[0], database:data[1]},
	  }).done(function( html ) {
	      jQuery("#content").html(html);
	    });
  });
</script>