
<?php
include_once 'include/sqlParser.php';
include_once 'include/ul.php';
$erreur = "vide";
$flag = '0';
if(isset($_FILES['uploaded']))
{
    $filename = $_FILES['uploaded']['name'];
    $filesize = $_FILES['uploaded']['size'];
    $file = $_FILES['uploaded']['tmp_name'];
    $extension = end(explode($filename, "."));
    if(checkSize($filename, $filesize))
    {
        if ($extension == "gzip" or $extension  == "zip")
        {
            $name = explode($filename, "."); 
            $filename = $name[0].$name[1];
            zip_extract($file, "../upload");
        }
        $currentFile= copyFile($filename, $file);
        $mySql = file_get_contents($currentFile);
        $erreur = requestSql($mySql);
    }
    $flag = '1';
}
?>
<br/>
<div id="window">

  <script type="text/javascript">
                function change_onglet(name)
                {
                        document.getElementById('onglet_' + anc_onglet).className = 'onglet_0 onglet';
                        document.getElementById('onglet_' + name).className = 'onglet_1 onglet';
                        document.getElementById('contenu_onglet_' + anc_onglet).style.display = 'none';
                        document.getElementById('contenu_onglet_' + name).style.display = 'block';
                        anc_onglet = name;
                }
        </script>

        <div class="systeme_onglets">
			<div class="onglets">
				<span class="onglet_0 onglet" id="onglet_database"
				 onclick="javascript:change_onglet('database');"><img src="images/b_tblanalyse.png"><b> Database</b></span>
				<span class="onglet_0 onglet" id="onglet_sql"
				 onclick="javascript:change_onglet('sql');"><img src="images/b_sql.png"><b> SQL</b></span>
				<span class="onglet_0 onglet" id="onglet_status"
				 onclick="javascript:change_onglet('status');"><img src="images/s_status.png"><b> Status</b></span>
				 <span class="onglet_0 onglet" id="onglet_users"
				 onclick="javascript:change_onglet('users');"><img src="images/s_passwd.png"><b> Users</b></span>
				 <span class="onglet_0 onglet" id="onglet_export"
				 onclick="javascript:change_onglet('export');"><img src="images/b_export.png"><b> Export</b></span>
				 <span class="onglet_0 onglet" id="onglet_import"
				 onclick="javascript:change_onglet('import');"><img src="images/b_import.png"><b> Import</b></span>
				 <span class="onglet_0 onglet" id="onglet_settings"
				 onclick="javascript:change_onglet('settings');"><img src="images/b_tblops.png"><b> Settings</b></span>
			</div>

			<div class="contenu_onglets">
				<div class="contenu_onglet" id="contenu_onglet_database">
					<article id="content">
	<?php
		try {
   		$bdd = new PDO("mysql:host=" . $_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
		} 
		catch (PDOException $e) {
			echo 'Connection failed : ' . $e->getMessage();
		}
		if(isset($_POST['nametable']) && isset($_GET['db']))
		{
			try
			{
				$bdd->exec("use ". $_GET['db']);
			    $bdd->exec("CREATE TABLE " . $_POST['nametable']. "(id INT NOT NULL AUTO_INCREMENT,PRIMARY KEY(id))");
			}
			catch (PDOException $e)
			{
				echo "<div class='error'>Impossible d'ajouter la table ".$e."</div>";
			}
		}
	?>

					<table class="table">
						<tr>
							<th>Database</th>
							<th>Suppresion</th>
						</tr>
<?php
			$connexion = mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
		    $sql = "SHOW DATABASES";
		    $result = mysql_query($sql) or die("Erreur SQL : ".$sql);
		    while($table = mysql_fetch_array($result))
		    {
		    	echo "<tr><td>".$table['Database']."</td><td><a 
		    	onclick='return alertDrop(\"".$table['Database']."\");' href='include/supprTab.php?table=".$table['Database']."'>
		    	<img src='images/delete.png'></td></tr>";
		    }
		?>
	</table>
					</article>
				</div>
				<div class="contenu_onglet" id="contenu_onglet_sql">
					<?php require_once 'include/sqlRequest.php'; ?>
				</div>

				<div class="contenu_onglet" id="contenu_onglet_status">
					<?php require_once 'include/statusBdd.php'; ?>
				</div>
				<div class="contenu_onglet" id="contenu_onglet_users">
					<?php require_once 'include/users.php'; ?>
				</div>
				<div class="contenu_onglet" id="contenu_onglet_export">
					<?php require_once 'include/export.php'; ?>
				</div>
				<div class="contenu_onglet" id="contenu_onglet_import">
					<?php require_once 'include/import.php'; ?>
				</div>
				<div class="contenu_onglet" id="contenu_onglet_settings">
					<?php require_once 'include/settings.php'; ?>
				</div>
				<?php
					if(isset($_POST['ong']) && $_POST['ong'] == "sql")
						echo "
								<script type='text/javascript'>
								   var anc_onglet = 'sql';
								   change_onglet(anc_onglet);
								</script>";
					else if ($flag == '1')
						echo "
								<script type='text/javascript'>
								   var anc_onglet = 'import';
								   change_onglet(anc_onglet);
								</script>";
					else
						echo "
								<script type='text/javascript'>
								   var anc_onglet = 'database';
								   change_onglet(anc_onglet);
								</script>";
				?>
			</div>

		</div>
</div>