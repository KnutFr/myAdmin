<article id="content">
	<h3><img src="images/b_import.png" alt="export">
	Imports sur le serveur actuel</h3>
	<form action="index.php" method="post" enctype="multipart/form-data">
	<h4>Fichier à importer:</h4>
	<hr>
	<p>File may be compressed (gzip, bzip2, zip) or uncompressed.
	A compressed file's name must end in .[format].[compression]. Example: .sql.zip</p><br/>
	Browse your computer: <input type="file" name="uploaded"> (Max: 20MiB)<br/><br/>

	<br/>
	<input type="submit" value="Go">
</form>
<br/><br/>
<?php 
if($erreur == "none")
	echo "<div class='success'>Le script a bien été effectué !</div>";
else if ($erreur == "vide")
	echo "";
else
	echo "<div class='error'>".$erreur."</div>";
?>
</article>