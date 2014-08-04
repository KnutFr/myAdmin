<?php 
require_once 'sqlParser.php';
$erreur2= "vide";
if (isset($_POST['input']))
{
	$queries = $_POST['input'];
	$erreur2 = requestSql($queries);
}

?>
<article>
	<?php
if($erreur2 == "none")
	echo "<div class='success'>Le script a bien été effectué !</div>";
else if ($erreur2 == "vide")
	echo "";
else
	echo "<div class='error'>".$erreur2."</div>";
?>
<form action="#" method="post" name="formSql">
	<div id="d_button">
		<!-- <?php echo $_SESSION['database']; ?> -->
		<div id="r_btn">
			<input type="button" value="select" name="select" onClick="addSql();" id="sql_btn"/><br>
			<input type="button" value="create" name="create" onClick="createSql();" id="sql_btn"/><br>
			<input type="button" value="insert" name="insert" onClick="insertSql();" id="sql_btn"/><br>
			<input type="button" value="delete" name="delete" onClick="deleteSql();" id="sql_btn"/><br>
			<input type="button" value="update" name="update" onClick="updateSql();" id="sql_btn"/><br>
			<input type="button" value="db_create" name="create_d" onClick="dbCreate();" id="sql_btn"/><br>
			<input type="button" value="drop" name="drop" onClick="dropSql();" id="sql_btn"/>
		</div>

		<div id="sql">
			<h2>SQL</h2>
			
				<input type="hidden" name="ong" value="sql">
				<textarea name="input" id="input" placeholder="Ecrire votre SQL ici"><?php echo @$input; ?></textarea><br>
				<input type="submit" value="Valider" name="valid"/>
				<input type="reset"  value="Annuler" name="annuler"><?php $input = ""; ?></input>
			
		</div>
	</div>
	</form>
</article>