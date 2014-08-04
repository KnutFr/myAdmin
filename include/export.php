
<article id="content">
<h3><img src="images/b_export.png" alt="export">
Export des bases depuis le serveur actuel</h3>

<h4>Méthode d'export :</h4> 
<hr><br/><br/>

<input type="radio" checked name="group1" value="quick" onClick="changeQuick();"> Rapide  - Affiche le minimum d'options<br/>
<input type="radio" name="group1" value="custom" onClick="changeCustom();"> Personnaliser - Affiche l'ensemble des options d'export (not implemented yet)<br/><br/>
<form method="post" name="export" action="include/dl.php">
	<input type="hidden" name="sql" value="export">
<div id="quick" class="quick" style="visibility:visible">
	<h4>Format :</h4> 
	<hr>

	<select name="kind">
		<option value="csv">CSV</option>
		<option value="excel">CSV for MS Excel</option>
		<option value="htmlword">Microsoft Word 2000</option>
		<option value="pdf">PDF</option>
		<option value="php_array">PHP array</option>
		<option selected="selected" value="sql">SQL</option>
	</select>
</div>
<div id="custom" class="custom" style="visibility:hidden">
	<h4>Format :</h4> 
	<hr>

	<select name="kind">
		<option value="csv">CSV</option>
		<option value="excel">CSV for MS Excel</option>
		<option value="htmlword">Microsoft Word 2000</option>
		<option value="pdf">PDF</option>
		<option value="php_array">PHP array</option>
		<option selected="selected" value="sql">SQL</option>
	</select>


	<hr>
	<input type="radio" value="file"><label>Sauvegarder la sortie vers un fichier</label><br/>
	<label>Nom du fichier :</label> <input type="text" name="nomFichier" value="localhost.sql"><br/><br/>
	<input type="radio" value="text"><label>Voir la sortie en texte</label><br/>

	<h4>Database(s):</h4>
	<hr>
	<br/>

	<select name="databases" multiple="multiple" size="10">
	<?php
	$serveur = $_SESSION['server'];
	$login  = $_SESSION['username'];
	$password = $_SESSION['password'];
	$connexion = mysql_connect($serveur, $login, $password);
    $sql = "SHOW DATABASES";
    $result = mysql_query($sql) or die("Erreur SQL : ".$sql);
    while($table = mysql_fetch_array($result))
    {
    	echo "<option value='".$table['Database']."'>".$table['Database']."</option>";
    }
 	?>
 	</select>

 	<br/>
 	<h4>Options spécifiques:</h4>
 	<hr>
<input type="checkbox" name="comms">Display comments (includes info such as export timestamp, PHP version, and server version)
</div>
<br/><br/>
<input type="submit" value="Go">
</form>
<br/><br/></article>