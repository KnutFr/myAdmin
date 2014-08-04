<?php session_start(); ?>
<div class="confirmbox">
	<span>Souhaitez vous vraiment <strong>vider</strong> cette table (<?php echo $_GET['table'] ?>) ?</span>

<?php
   
    $tab = array($_GET['table'], $_GET['database']);
?>


    <p onClick="confirmQuery('TRUNCATE','<?php echo $_GET['table'] ?>', '<?php echo $_GET['database'] ?>'); return false;">Oui</p>
    <p onClick="Modalbox.hide();">Non</p>
</div>