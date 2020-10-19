<?php
include 'koneksi.php';
$title = $_POST['title'];
$note = $_POST['note'];

$connect->query("INSERT INTO tb_notes (title, note)
values('".$title."', '".$note."')");
