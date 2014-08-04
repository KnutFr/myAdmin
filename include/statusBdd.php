<article id="content">
	<h2 class="titleCenter">Informations concernant la base : </h2><br/>
		<table width="80%" class="statusTab" border="1px">
			<tr>
				<th>Information</th>
				<th>Valeurs</th>
			</tr>

		<?php 
		mysql_connect($_SESSION['server'], $_SESSION['username'], $_SESSION['password']);
		$req = mysql_query("show status") or die ("SQL Error : version");
		while ($data = mysql_fetch_array($req))
            {
            	echo "<tr><td>".$data['Variable_name']."</td><td>".$data['Value']."</td></tr>";
            }
		?>

		</table>
</article>