<?php

include("connect.php");
header("Connect-type = text/html; charset = utf8");

$slcdb=mysqli_select_db($db_link,"simpleml1");
if(!$slcdb){
	die("資料庫選擇失敗");
}
$nowdata=$_POST['nowdata'];
$sql_query = "INSERT INTO `record`(`building`, `room`, `area`, `elevator`, `buildingtype`, `landtype`, `totalfloor`, `house`, `kmeans_cluster`, `kmeans_pep`, `knn_id`, `knn_pep`, `ca_pep`) VALUES ('".$nowdata[0]."','".$nowdata[1]."','".$nowdata[2]."','".$nowdata[3]."','".$nowdata[4]."','".$nowdata[5]."','".$nowdata[6]."','".$nowdata[7]."','".$nowdata[8]."','".$nowdata[9]."','".$nowdata[10]."','".$nowdata[11]."','".$nowdata[12]. "')";
$result=mysqli_query($db_link, $sql_query);
$sql_lastone= "SELECT `id` FROM `record` order by `id` desc LIMIT 0 , 1";
$lastonequery=mysqli_query($db_link, $sql_lastone);
$row=mysqli_fetch_array($lastonequery, MYSQLI_ASSOC);
if($result){
	echo $row["id"];
}
else{
	echo $sql_query;
}


?>