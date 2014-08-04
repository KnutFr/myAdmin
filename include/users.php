<article id="content">
<?php
		mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
		$sql = "SELECT DISTINCT `GRANTEE` as user,`PRIVILEGE_TYPE` as type FROM `information_schema`.`USER_PRIVILEGES`";
		$req = mysql_query($sql) or die ("SQL Error : ".$sql);
		$user = "";
		$type = "";
		$i = 0;
		while ($data = mysql_fetch_array($req))
        {
        	if(isset($user[$i]) && $user[$i] == $data['user'])
        		$type[$i] .= ", ".$data['type'];
        	else
        	{
        		$i++;
        		$user[$i] = $data['user'];
				$type[$i] = $data['type'];
				
			}
		}
?>
<h2 class="titleCenter">Listes des utilisateurs et autorisations : </h2>
<br/>
<table width="80%" class="statusTab" border="1px">
				<tr>
				<th>Utilisateur @ Access</th>
				<th>Autorisations</th>
				<th>Suppresion de l'utilisateur <br/>
				<font size="1"><i>(La suppression de l'utilisateur entraine la suppresion de l'ensemble de ces accés)</i></font>
			</th>
			</tr>
<?php 
for($i = 1; $i < count($user); $i++)
{
	$myUser = explode("'",$user[$i] );
	echo "<tr><td>".$user[$i]."</td><td>".$type[$i]."</td><td><a href='deluser.php?".$myUser[1]."'>suppresion</a></td></tr>";
}
?>
</table>
<br/><br/>
<form action="adduser.php" class="titleCenter">
<input type="text" name="user"><input type="submit" value="Ajouter un utilisateur">
</form>
</article>