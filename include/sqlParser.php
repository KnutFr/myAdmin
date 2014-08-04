<?php
function requestSql($queries)
{
	$error = "none";

	$link = mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
	if (isset($_SESSION['database']))
		mysql_select_db($_SESSION['database']);
	$input = explode(';', $queries);
	$cpt = 0;
	while ($cpt < count($input))
	{
		if	(trim($input[$cpt]) != '')
		{
			$req = mysql_query($input[$cpt]);
			if ($req === false) 
			{
				$error = "<div class='error'>Votre requete est incorrecte ".mysql_error($link)."<br/>dans ".nl2br($input[$cpt])."</div>";
			}
			else if(stristr($input[$cpt], "select"))
			{
				$result = mysql_fetch_assoc($req);
				$col = array_keys($result);
				echo "<table class='table'><thead><tr>";
				foreach ($col as $key => $value)
					echo "<th> $value </th>";
				echo "</tr></thead><tbody><tr>";
				foreach ($result as $key => $value) 
					echo "<td> $value </td>";
				echo "</tr>";
				while ($result = mysql_fetch_assoc($req)) 
				{
					echo "<tr>";
					foreach ($result as $key => $value) 
						echo "<td> $value </td>";
					echo "</tr>";
				}
				echo "</tbody></table>";
			}
		}
		$cpt++;
	}

	return ($error);
}
?>