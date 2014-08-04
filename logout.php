<?php session_start(); ?>
<?php $_SESSION['username'] = NULL; ?>
<?php session_destroy(); ?>
<?php header('Location:login.php'); ?>