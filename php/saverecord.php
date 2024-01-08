<?php

include("connect.php");
header("Connect-type: text/html; charset = utf-8");

$slcdb=mysqli_select_db($db_link,"finaltree");
if(!$slcdb){
	die("資料庫選擇失敗");
}
$building=$_POST["buildingtext"];
$room=$_POST["roomtext"];
$area=$_POST["areaselect"];
$elevator=$_POST["elevatorselect"];
$buildingtype=$_POST["buildingtypeselect"];
$landtype=$_POST["landtypeselect"];
$totalfloor=$_POST["totalfloortext"];
$house=$_POST["housetext"];
$predictedpep=$_POST["finalanswer"];

$sql_query = "INSERT INTO `record`( `building`, `room`, `area`, `elevator`, `buildingtype`, `landtype`, `totalfloor`, `house`, `predicted pep`) VALUES (".$building.",".$room.",'".$area."','".$elevator."','".$buildingtype."','".$landtype."',".$totalfloor.",".$house.",'".$predictedpep. "')";

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