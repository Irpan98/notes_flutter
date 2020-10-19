<?php
$connect = new mysqli("localhost", "root", "", "db_notes");
if($connect){
}
else{
echo "Connection Failed";
exit();
}
?>
