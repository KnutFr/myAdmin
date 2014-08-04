<?php session_start(); ?>
<div class="confirmbox">
	<span>Souhaitez vous vraiment <strong>supprimer</strong> cette table (<?php echo $_GET['table'] ?>) ?</span>
    <p onClick="confirmQuery('DROP', '<?php echo $_GET['table'] ?>', '<?php echo $_GET['database'] ?>'); return false;">Oui</p>
    <p onClick="Modalbox.hide();">Non</p>
</div>