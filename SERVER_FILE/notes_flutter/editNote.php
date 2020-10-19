<?php
include 'koneksi.php';
$id = $_POST['id'];
$title = $_POST['title'];
$note = $_POST['note'];

$connect->query("UPDATE tb_notes SET title='$title',
note='$note' WHERE id='$id.'");

?>
