window.onload=function(){
	document.getElementById("buildingtext").value="";
	document.getElementById("roomtext").value="";
	document.getElementById("areaselect").value="";
	document.getElementById("elevatorselect").value="";
	document.getElementById("buildingtypeselect").value="";
	document.getElementById("landtypeselect").value="";
	document.getElementById("totalfloortext").value="";
	document.getElementById("housetext").value="";
}

function confirm(){
	if (document.getElementById("elevatorselect").value=="有") {
			if (document.getElementById("landtypeselect").value=="住商用") {
				document.getElementById("finalanswer").innerHTML="無";
			}
			else if (document.getElementById("landtypeselect").value=="工業用") {
				document.getElementById("finalanswer").innerHTML="無";
			}
			else if (document.getElementById("landtypeselect").value=="住家用") {
				if (document.getElementById("totalfloortext").value<=7){
					if(document.getElementById("areaselect").value=="中山區"){
						document.getElementById("finalanswer").innerHTML="無";
					}
					else{
						document.getElementById("finalanswer").innerHTML="有";
					}
				}
				else{
						document.getElementById("finalanswer").innerHTML="有";
				}
			}
			else {
				document.getElementById("finalanswer").innerHTML="有";
			}
			
		}
		else{
			document.getElementById("finalanswer").innerHTML="無";
		}
	$.ajax({
		type:"POST",
		url:"php/saverecord.php",
		data:{
			"buildingtext":document.getElementById("buildingtext").value,
			"roomtext":document.getElementById("roomtext").value,
			"areaselect":document.getElementById("areaselect").value,
			"elevatorselect":document.getElementById("elevatorselect").value,
			"buildingtypeselect":document.getElementById("buildingtypeselect").value,
			"landtypeselect":document.getElementById("landtypeselect").value,
			"totalfloortext":document.getElementById("totalfloortext").value,
			"housetext":document.getElementById("housetext").value,
			"finalanswer":document.getElementById("finalanswer").innerHTML,

		},
		success:function(data){
			alert("第"+data+"筆資料記錄成功");
		},
		error:function(){
			alert("發生錯誤 狀態:" + jqXHR.readyState + "     "+ jqXHR.status);
		},
	})

	document.getElementById("buildingtext").value="";
	document.getElementById("roomtext").value="";
	document.getElementById("areaselect").value="";
	document.getElementById("elevatorselect").value="";
	document.getElementById("buildingtypeselect").value="";
	document.getElementById("landtypeselect").value="";
	document.getElementById("totalfloortext").value="";
	document.getElementById("housetext").value="";
}
function confirm2(){
	document.getElementById("finalanswer").innerHTML="";
}