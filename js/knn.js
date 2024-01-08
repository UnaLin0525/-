var alldata = new Object();
var nowdata = new Array(13);

window.onload = function(){
	document.getElementById("buildingtext").value="";
	document.getElementById("roomtext").value="";
	document.getElementById("areaselect").value="";
	document.getElementById("elevatorselect").value="";
	document.getElementById("buildingtypeselect").value="";
	document.getElementById("landtypeselect").value="";
	document.getElementById("totalfloortext").value="";
	document.getElementById("housetext").value="";
	queryallfromdb("kmeanscentroid");
	queryallfromdb("testdata");
}

function queryallfromdb(target){
	$.ajax({
		type:"POST",
		url:"php/simpleml_sql.php",
		data:{
			"targettable":target,
		},
		success:function(data){
			data=JSON.parse(data);
			console.log(data);
			alldata[target] = data;
		},
		error:function(){
			alert("發生錯誤 狀態:"+jqXHR.readyState+ "     "+jqXHR.status);
		},
	})
}

function testinput(){
	if(document.getElementById("buildingtext").value!="" &&
		document.getElementById("roomtext").value!="" &&
		document.getElementById("areaselect").value!="" &&
		document.getElementById("elevatorselect").value!="" &&
		document.getElementById("buildingtypeselect").value!="" &&
		document.getElementById("landtypeselect").value!=""&&
		document.getElementById("totalfloortext").value!=""&&
		document.getElementById("housetext").value!=""
		)
	{
		if (document.getElementById("buildingtext").value>=0 &&
			document.getElementById("buildingtext").value<=22 &&
			document.getElementById("roomtext").value>=0 &&
			document.getElementById("roomtext").value<=50 &&
			document.getElementById("totalfloortext").value>0 &&
			document.getElementById("totalfloortext").value<=100 &&
			document.getElementById("housetext").value>=0)
		{
			nowdata[0] = document.getElementById("buildingtext").value;
			nowdata[1] = document.getElementById("roomtext").value;
			nowdata[2] = document.getElementById("areaselect").value;
			nowdata[3] = document.getElementById("elevatorselect").value;
			nowdata[4] = document.getElementById("buildingtypeselect").value;
			nowdata[5] = document.getElementById("landtypeselect").value;
			nowdata[6] = document.getElementById("totalfloortext").value;
			nowdata[7] = document.getElementById("housetext").value;
			console.log(nowdata);

			return ("success");
		}
		else{
			alert("請確認建物數、房間數、總樓層、屋齡資料是否正確");
		}
	}
	else{
		alert("請完整填寫上述表單!");
	}
}

function kmeans(){
	if (testinput()!="success"){
		return;
	}
	else{
		var kscore = new Array(6);
		for (var j = 0; j <= 5; j++) {	
			var tempscore = 0;
			for (var i = 0; i <= 7; i++) {
				if (i==0) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["kmeanscentroid"][j][i+1])/(2-0);
				}
				else if (i==1) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["kmeanscentroid"][j][i+1])/(7 - 0);
				}
				else if (i==6) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["kmeanscentroid"][j][i+1])/(31 - 1);
				}
				else if (i==7) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["kmeanscentroid"][j][i+1])/(610.17 - 0);
				}
				else {
					if(nowdata[i]==alldata["kmeanscentroid"][j][i+1]){
						tempscore+=1;
					}
				}

			}
		kscore[j] = tempscore;
		}
		var nowcluster = kscore.indexOf(Math.max.apply(null,kscore))+1;
		document.getElementById("nowcluster").innerHTML = nowcluster;
		var nowkmeanspep = alldata["kmeanscentroid"][nowcluster-1][9];
		document.getElementById("nowkmeanspep").innerHTML = nowkmeanspep;
		nowdata[8]=nowcluster;
		nowdata[9]=nowkmeanspep;
	}
}

function knn(){
	if (testinput()!="success") {
		return;
	}else{
		var knnscore = new Array(641);
		for (var j = 0; j <=640 ; j++) {
			var tempscore = 0;
			for (var i = 0; i <= 7; i++) {
				if (i==0) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["testdata"][j][i+1])/(2-0);
				}
				else if (i==1) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["testdata"][j][i+1])/(7 - 0);
				}
				else if (i==6) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["testdata"][j][i+1])/(31 - 1);
				}
				else if (i==7) {
					tempscore+= 1-Math.abs(nowdata[i]-alldata["testdata"][j][i+1])/(610.17 - 0);
				}
				else{
					if(nowdata[i]==alldata["testdata"][j][i+1]){
						tempscore+=1;
					}
				}
			}
			knnscore[j] = tempscore;
		}
		console.log(knnscore);
	}
	var nowknnid = knnscore.indexOf(Math.max.apply(null,knnscore))+1;
	document.getElementById("nowknnid").innerHTML = nowknnid;
	var nowknnpep = alldata["testdata"][nowknnid-1][9];
	document.getElementById("nowknnpep").innerHTML = nowknnpep;
	nowdata[10]=nowknnid;
	nowdata[11]=nowknnpep;
	
}

function crossanalysis(){
	var nowcapep="";
	if (!nowdata[8]) {
		alert("請先進行Kmeans");
	}
	else if (nowdata[8]=="6"){
		if (nowdata[4]=="住宅大樓(11樓以上有電梯)") {
			nowcapep="一定會有管理組織";
		}
		else if (nowdata[3]=="有") {
			nowcapep="一定會有管理組織";
		}
		else if (nowdata[5]=="住家用") {
			nowcapep="一定會有管理組織";
		}
	}
	else if (nowdata[8]=="5"){
		if (nowdata[2]=="中山區") {
			nowcapep="一定會有管理組織";
		}
		else if (nowdata[6]=="15") {
			nowcapep="一定會有管理組織";
		}
		else if (nowdata[5]=="住家用") {
			nowcapep="一定會有管理組織";
		}
	}
	else if (nowdata[8]=="4") {
		if (nowdata[2]=="信義區") {
			nowcapep="一定會有管理組織";
		}
	}
	else if (nowdata[8]=="2") {
		if (nowdata[4]=="公寓(5樓以下無電梯)") {
			nowcapep="一定不會有管理組織";
		}

	}
	else if (nowdata[8]=="1") {
		if (nowdata[2]=="中正區") {
			nowcapep="一定不會有管理組織";
		}
		else if (nowdata[4]=="透天厝") {
			nowcapep="一定不會有管理組織";
		}
	}
	if (!nowcapep) {
		nowcapep="NONE";
	}
	document.getElementById("nowcafinal").innerHTML = nowcapep;
	nowdata[12]=nowcapep;
}

function sendresult(){
	if (!nowdata[8]) {
		alert("請先進行Kmeans");
		return;
	}
	else if (!nowdata[10]) {
		alert("請先進行KNN");
		return;
	}
	else if (!nowdata[12]) {
		alert("請先進行交叉分析");
		return;
	}
	else{
		$.ajax({
		type:"POST",
		url:"php/savedata.php",
		data:{
			"nowdata":nowdata,
		},
		success:function(data){
			alert("第"+data+"筆資料記錄成功");
		},
		error:function(){
			alert("發生錯誤 狀態:" + jqXHR.readyState + "     "+ jqXHR.status);
		},
		})
	}
	emptyInput();
	nowdata.length=0;
}
function emptyInput() {
	document.getElementById("buildingtext").value="";
	document.getElementById("roomtext").value="";
	document.getElementById("areaselect").value="";
	document.getElementById("elevatorselect").value="";
	document.getElementById("buildingtypeselect").value="";
	document.getElementById("landtypeselect").value="";
	document.getElementById("totalfloortext").value="";
	document.getElementById("housetext").value="";
	document.getElementById('nowcluster').innerHTML="";
	document.getElementById('nowkmeanspep').innerHTML="";
	document.getElementById('nowknnid').innerHTML="";
	document.getElementById('nowknnpep').innerHTML="";
	document.getElementById('nowcafinal').innerHTML="";
}