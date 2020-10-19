<?php
include 'koneksi.php';
$id=$_POST['id'];
$connect->query("DELETE FROM tb_notes WHERE id='$id'");
?>